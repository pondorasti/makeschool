//
//  ChatRoomViewController.swift
//  Make-ChatRooms
//
//  Created by Matthew Harrilal on 2/3/19.
//  Copyright © 2019 Matthew Harrilal. All rights reserved.
//

import Foundation
import UIKit

class ChatRoomViewController: UIViewController {
    let tableView = UITableView()
    let chatRoom = ChatRoom()
    var roomName = ""
    
    // Instantiate the message input view that adds itself as a subview
    let messageInputBar = MessageInputView()
    
    var messages = [Message]()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        ChatRoom.shared.delegate = self
//        self.navigationItem.title = ChatRoom.shared.room?.roomName
        self.navigationItem.title = self.roomName
    }
    
}



//MARK - Message Input Bar
extension ChatRoomViewController: MessageInputDelegate {
    func sendWasTapped(message: String) {
        let userDefaults = UserDefaults()
        guard let username = userDefaults.value(forKey: "username") else {return}
        print("Sent Message \(message)")
        let messageObject = Message(messageContent: message, senderUsername: username as! String, messageSender: true, roomOriginName: self.roomName)
        chatRoom.sendMessage(message: messageObject)
        insertNewMessageCell(messageObject)
       
    }
}

extension ChatRoomViewController: ChatRoomDelegate {
    
    // You know if you are receiving a message then you are not the sender therefore you can set message sender to false
    func recievedMessage(message: Message) {
//        guard let roomName = message.roomOriginName else {return}
        message.messageSender = false
        
        
        if message.roomOriginName == self.roomName {
            insertNewMessageCell(message)
        }
        
    }
}
