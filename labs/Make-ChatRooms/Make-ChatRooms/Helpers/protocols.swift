//
//  protocols.swift
//  Make-ChatRooms
//
//  Created by Matthew Harrilal on 1/30/19.
//  Copyright © 2019 Matthew Harrilal. All rights reserved.
//

import Foundation

// In chargre of transitioning to the list of active rooms a user is in
protocol RoomTransition: class {
    func transitionToRoom()
}

// Triggered when recived a message and routing back to the Chat Room to relay the message
protocol ChatRoomDelegate: class {
    func recievedMessage(message: Message)
}

// Triggered when there is another instance of a username in charge of notifying the view to display an alert
protocol UsernameDelegate: class {
    func usernameCollision()
}


// In charge of notifying the controller and relaying the message to be sent over the socket connection!
protocol MessageInputDelegate: class {
    func sendWasTapped(message: String)
}
