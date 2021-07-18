//: Playground - noun: a place where people can play

import UIKit
import Foundation
import PlaygroundSupport

let PostCompleted = "postCompleted"
let PostNotification = Notification.Name(rawValue: PostCompleted)
let notificaton = Notification(name: PostNotification)


NotificationCenter.default.addObserver(forName: PostNotification, object: nil, queue: nil) { (not) in
    print(not)
}

class Listner {
    init() {
        NotificationCenter.default.addObserver(self, selector: #selector(Listner.notified(notificaton:)), name: PostNotification, object: nil)
    }
    
    @objc func notified(notificaton: Notification) {
        print(notificaton)
    }

}
let listner = Listner()


NotificationCenter.default.post(notificaton)

// KVO
class User: NSObject {
    dynamic var name: String
    
    init(name: String) {
        self.name = name
    }
}

class Observer: NSObject {
    var user: User
    
    init(user: User) {
        self.user = user
        super.init()
        
        self.user.addObserver(self, forKeyPath: "name", options: NSKeyValueObservingOptions.new, context: nil)
    }
    
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        
        if let newValue = change?[NSKeyValueChangeKey.newKey] {
            print("Name changed: \(newValue)")
        } else {
            super.observeValue(forKeyPath: keyPath, of: object, change: change, context: context)
        }
    }
    
    deinit {
        self.user.removeObserver(self, forKeyPath: "name")
    }
}

let observer = Observer(user: User(name: "Eliel"))
observer.user.name = "Peter"
observer.user.name = "Johnson"


func someFunc() throws {
    try String(contentsOfFile: "test.text", encoding: String.Encoding.utf8)
}

do {
    try someFunc()
} catch {
    
}

func fetchUser(completion: @escaping (User) -> Void) {
    completion(User(name: "Eliel"))
}
