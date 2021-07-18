//
//  Layouts.swift
//  Make-ChatRooms
//
//  Created by Matthew Harrilal on 2/3/19.
//  Copyright © 2019 Matthew Harrilal. All rights reserved.
//

import Foundation
import UIKit

extension ChatRoomViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        loadViews() // Layout for how the messages and c hat interface should look!
    }
    
    
    func keyboardWillChange(notification: NSNotification) {
        if let userInfo = notification.userInfo {
            let endFrame = (userInfo[UIKeyboardFrameEndUserInfoKey] as? NSValue)!.cgRectValue
            let messageBarHeight = self.messageInputBar.bounds.size.height
            let point = CGPoint(x: self.messageInputBar.center.x, y: endFrame.origin.y - messageBarHeight/2.0)
            let inset = UIEdgeInsets(top: 0, left: 0, bottom: endFrame.size.height, right: 0)
            UIView.animate(withDuration: 0.25) {
                self.messageInputBar.center = point
                self.tableView.contentInset = inset
            }
        }
    }
    
    // Upon view did loading configure views to be connected and added as subviews
    func loadViews() {
        navigationItem.backBarButtonItem?.title = "Run!"
        
        view.backgroundColor = UIColor(red: 24/255, green: 180/255, blue: 128/255, alpha: 1.0)
        
        tableView.dataSource = self
        tableView.delegate = self
        tableView.separatorStyle = .none
        
        view.addSubview(tableView)
        view.addSubview(messageInputBar)
        
        messageInputBar.delegate = self 
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        let messageBarHeight:CGFloat = 60.0
        let size = view.bounds.size
        tableView.frame = CGRect(x: 0, y: 0, width: size.width, height: size.height - messageBarHeight)
        messageInputBar.frame = CGRect(x: 0, y: size.height - messageBarHeight, width: size.width, height: messageBarHeight)
    }
}

extension MessageTableViewCell {

    override func layoutSubviews() {
        super.layoutSubviews()
        
        if isJoinMessage() {
            layoutForJoinMessage()
            
        } else {
            messageContentLabel.font = UIFont(name: "Helvetica", size: 17) //UIFont.systemFont(ofSize: 17)
            messageContentLabel.textColor = .white
            
            let size = messageContentLabel.sizeThatFits(CGSize(width: 2*(bounds.size.width/3), height: CGFloat.greatestFiniteMagnitude))
            messageContentLabel.frame = CGRect(x: 0, y: 0, width: size.width + 32, height: size.height + 16)
            
            
            // If the user is the one who initiated the message that is being sent currently
            if self.message?.messageSender == true {
                nameLabel.isHidden = true
                
                messageContentLabel.center = CGPoint(x: bounds.size.width - messageContentLabel.bounds.size.width/2.0 - 16, y: bounds.size.height/2.0)
                messageContentLabel.backgroundColor = UIColor(red: 24/255, green: 180/255, blue: 128/255, alpha: 1.0)
            } else {
                nameLabel.isHidden = false
                nameLabel.sizeToFit()
                nameLabel.center = CGPoint(x: nameLabel.bounds.size.width/2.0 + 16 + 4, y: nameLabel.bounds.size.height/2.0 + 4)
                
                messageContentLabel.center = CGPoint(x: messageContentLabel.bounds.size.width/2.0 + 16, y: messageContentLabel.bounds.size.height/2.0 + nameLabel.bounds.size.height + 8)
                messageContentLabel.backgroundColor = .lightGray
            }
            
        }
        
        messageContentLabel.layer.cornerRadius = min(messageContentLabel.bounds.size.height/2.0, 20)
    }
    
    func layoutForJoinMessage() {
        messageContentLabel.font = UIFont.systemFont(ofSize: 10)
        messageContentLabel.textColor = .lightGray
        messageContentLabel.backgroundColor = UIColor(red: 247/255, green: 247/255, blue: 247/255, alpha: 1.0)
        
        let size = messageContentLabel.sizeThatFits(CGSize(width: 2*(bounds.size.width/3), height: CGFloat.greatestFiniteMagnitude))
        messageContentLabel.frame = CGRect(x: 0, y: 0, width: size.width + 32, height: size.height + 16)
        messageContentLabel.center = CGPoint(x: bounds.size.width/2, y: bounds.size.height/2.0)
    }
    
    func isJoinMessage() -> Bool {
        if let words = messageContentLabel.text?.components(separatedBy: " ") {
            if words.count >= 2 && words[words.count - 2] == "has" && words[words.count - 1] == "joined" {
                return true
            }
        }
        
        return false
    }
}
