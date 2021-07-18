//
//  ChatRoom.swift
//  Make-ChatRooms
//
//  Created by Matthew Harrilal on 1/28/19.
//  Copyright © 2019 Matthew Harrilal. All rights reserved.
//

import Foundation
import SocketIO

class ChatRoom: NSObject {
    static var shared = ChatRoom()
    //    var user: User?
    var room: Room?
    
    // DELEGATES making all delegates weak to avoid a retain cycle
    weak var delegate: ChatRoomDelegate?
    weak var usernameDelegate: UsernameDelegate?
    weak var roomTransitionDelegate: RoomTransition?
    
    // MARK: TODO MAKE PORT THEIR RUNNING DYNAMIC ... LET THEM KNOW
    static let manager = SocketManager(socketURL: URL(string: "http://localhost:4000/")!, config: [.log(true), .compress])
    private var socket = manager.defaultSocket // Singleton instance  one socket connection per phone
    
    override init() {
        super.init()
        socket.connect() // When you instantiate the chat room the socket connects to the server
        emittedEvents()
    }
    
    
    func emittedEvents() {
        // Listening for a notification from the server for the corresponding events
        socket.on(clientEvent: .connect) {data, ack in
            print("socket connected")
        }
        
        
        socket.on(clientEvent: .disconnect) { (data, ack) in
            print("This is the disconnect data \(data)")
        }
        
        socket.on("chat message") { (data, ack) in
            guard let message = try? JSONDecoder().decode(Message.self, from: data[0] as! Data) else {return}
            self.delegate?.recievedMessage(message: message)
        }
        
        socket.on("usernameCollision") { (data, ack) in
            self.usernameDelegate?.usernameCollision()
            
        }
        
        socket.on("validUsername") { (data, ack) in
            
            // Upon a successful username trigger a transtion to the list of active rooms user is currently in
            print("Username has chosen a valid username")
            let username = data[0]
            let userDefaults = UserDefaults()
            userDefaults.set("socketUsername", forKey: String(describing: username)) // Safely cast username as string
            self.roomTransitionDelegate?.transitionToRoom()
        }
    }
    
    func sendNickname() {
        // Have to only save the username upon valid username
        guard let username = SharedUser.shared.user?.username else {return}
        self.socket.emit("socketUsername", username)
    }
    
    
    func sendMessage(message: Message) { // Has to conect first so triggering message isn't the first thing that occurs
        
        guard let jsonData = try? JSONEncoder().encode(message) else {return} // Have to encode because message object isnt a native json object
        
        
        self.socket.emit("chat message", jsonData)
    }
    
    func joinRoom() {
        guard let room = self.room else {return}
        
        self.socket.emit("joinRoom", room.roomName) // Join pre-exisiting chat room with given name being sent to server
        SharedUser.shared.user?.activeRooms?.append(room)
    }
    
    
    func createRoom(roomName: String) {
        self.socket.emit("createRoom", roomName) // Create room and send to the server the given name
    }
    
    
    func leaveRoom(roomName:String) {
        self.socket.emit("leaveRoom", roomName) // Leave the specified room that the user is in
    }
    
}




