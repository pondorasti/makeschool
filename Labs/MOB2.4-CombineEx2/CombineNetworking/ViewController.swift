//
//  ViewController.swift
//  CombineNetworking
//
//  Created by Adriana González Martínez on 2/28/21.
//

import UIKit
import Combine

class ViewController: UIViewController {
    
    let activityIndicator: UIActivityIndicatorView = {
        let indicator = UIActivityIndicatorView()
        indicator.translatesAutoresizingMaskIntoConstraints = false
        return indicator
    }()
    
    let usernameTextfield: UITextField = {
        let txt = UITextField()
        txt.translatesAutoresizingMaskIntoConstraints = false
        txt.placeholder = "Search a username"
        txt.autocapitalizationType = .none
        txt.textAlignment = .center
        txt.addTarget(self, action: #selector(textFieldEditingDidChange(_:)), for: UIControl.Event.editingChanged)
        return txt
    }()
    
    let repoCount: UILabel = {
        let lbl = UILabel()
        lbl.textColor = .lightGray
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = "No. of repositories: "
        lbl.textAlignment = .center
        return lbl
    }()
    
    let avatarImg: UIImageView = {
        let img = UIImageView()
        img.contentMode = .scaleAspectFit
        img.image = UIImage(systemName:"house")
        img.translatesAutoresizingMaskIntoConstraints = false
        return img
    }()
    
    let stack: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.distribution = .fill
        stack.axis = .vertical
        return stack
    }()
    
    var repositoryCountSubscriber: AnyCancellable?
    var avatarViewSubscriber: AnyCancellable?
    var usernameSubscriber: AnyCancellable?
    var apiNetworkActivitySubscriber: AnyCancellable?
    
    @Published var username: String = ""
    @Published private var githubUserData: [GithubAPIUser] = []
    
    var myBackgroundQueue: DispatchQueue = DispatchQueue(label: "myBackgroundQueue")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Github Finder 🔍"
        setupStack()
        apiNetworkActivitySubscriber = GithubAPI.networkActivityPublisher
            .receive(on: RunLoop.main)
            .sink { doingSomethingNow in
                if (doingSomethingNow) {
                    self.activityIndicator.startAnimating()
                } else {
                    self.activityIndicator.stopAnimating()
                }
            }
        
        usernameSubscriber = $username
            .throttle(for: 0.5, scheduler: myBackgroundQueue, latest: true)
            .removeDuplicates()
            .print("username pipeline: ")
            .map { username -> AnyPublisher<[GithubAPIUser], Never> in
                return GithubAPI.retrieveGithubUser(username: username)
            }
            .switchToLatest()
            .receive(on: RunLoop.main)
            .assign(to: \.githubUserData, on: self)
        
        repositoryCountSubscriber = $githubUserData
            .print("github user data: ")
            .map { userData -> String in
                if let firstUser = userData.first {
                    return "Repo count \(String(firstUser.public_repos))"
                }
                return "Repo count: Unknown"
            }
            .receive(on: RunLoop.main)
            .assign(to: \.text, on: repoCount)
        
        let avatarViewSub = $githubUserData
            .map { userData -> AnyPublisher<UIImage, Never> in
                guard let firstUser = userData.first else {
                    return Just(UIImage()).eraseToAnyPublisher()
                }
                return URLSession.shared.dataTaskPublisher(for: URL(string: firstUser.avatar_url)!)
                    .handleEvents(receiveSubscription: { _ in
                        DispatchQueue.main.async {
                            self.activityIndicator.startAnimating()
                        }
                    }, receiveCompletion: { _ in
                        DispatchQueue.main.async {
                            self.activityIndicator.stopAnimating()
                        }
                    }, receiveCancel: {
                        DispatchQueue.main.async {
                            self.activityIndicator.stopAnimating()
                        }
                    })
                    .map { $0.data }
                    .map { UIImage(data: $0)!}
                    .subscribe(on: self.myBackgroundQueue)
                    .catch { err in
                        return Just(UIImage())
                    }
                    .eraseToAnyPublisher()
            }
            .switchToLatest()
            .subscribe(on: myBackgroundQueue)
            .receive(on: RunLoop.main)
            .map { image -> UIImage? in
                image
            }
            .assign(to: \.image, on: self.avatarImg)
        
        avatarViewSubscriber = AnyCancellable(avatarViewSub)
        
        let _ = repoCount.publisher(for: \.text)
            .sink { someValue in
                print("repositoryCountLabel Updated to \(String(describing: someValue))")
            }
    }
    
    func setupStack(){
        self.view.addSubview(avatarImg)
        self.view.addSubview(usernameTextfield)
        self.view.addSubview(repoCount)
        self.view.addSubview(activityIndicator)
        NSLayoutConstraint.activate([
            avatarImg.heightAnchor.constraint(equalToConstant: 200),
            avatarImg.widthAnchor.constraint(equalToConstant: 200),
            avatarImg.centerYAnchor.constraint(equalTo: self.view.centerYAnchor),
            avatarImg.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            usernameTextfield.topAnchor.constraint(equalTo: avatarImg.bottomAnchor, constant: 30),
            usernameTextfield.centerXAnchor.constraint(equalTo: avatarImg.centerXAnchor),
            repoCount.topAnchor.constraint(equalTo: usernameTextfield.bottomAnchor, constant: 30),
            repoCount.centerXAnchor.constraint(equalTo: usernameTextfield.centerXAnchor),
            activityIndicator.centerXAnchor.constraint(equalTo: avatarImg.centerXAnchor),
            activityIndicator.centerYAnchor.constraint(equalTo: avatarImg.centerYAnchor)
        ])
    }
    
}
extension ViewController{
    @objc func textFieldEditingDidChange(_ sender: UITextField) {
        switch sender {
        case usernameTextfield:
            username = sender.text ?? ""
        default:
            break
        }
    }
}
