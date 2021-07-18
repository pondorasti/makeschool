//
//  MessageTableViewCell.swift
//  Make-ChatRooms
//
//  Created by Matthew Harrilal on 2/3/19.
//  Copyright © 2019 Matthew Harrilal. All rights reserved.
//

import Foundation
import UIKit


// To represent state of the sender of the message
//enum MessageSender {
//    case ourself
//    case someoneElse
//}


class MessageTableViewCell: UITableViewCell {
    //    var messageSender: MessageSender = .ourself
    let messageContentLabel = UILabel()
    let nameLabel = UILabel()
    var message: Message?
    
    func apply(message: Message) { // When applying a message to the cell update below information
        self.message = message
        nameLabel.text = message.senderUsername
        messageContentLabel.text = message.messageContent
        setNeedsLayout()
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        messageContentLabel.clipsToBounds = true
        messageContentLabel.textColor = .white
        messageContentLabel.numberOfLines = 0

        nameLabel.textColor = .lightGray
        nameLabel.font = UIFont(name: "Helvetica", size: 10)

        clipsToBounds = true
        addSubview(messageContentLabel)
        addSubview(nameLabel)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // Measurements and layout for messages
    private class func height(forText text: String, fontSize: CGFloat, maxSize: CGSize) -> CGFloat {
        let font = UIFont(name: "Helvetica", size: fontSize)!
        let attrString = NSAttributedString(string: text, attributes:[NSAttributedStringKey.font: font,
                                                                      NSAttributedStringKey.foregroundColor: UIColor.white])
        let textHeight = attrString.boundingRect(with: maxSize, options: .usesLineFragmentOrigin, context: nil).size.height
        
        return textHeight
    }
    
    class func height(for message: Message) -> CGFloat {
        let maxSize = CGSize(width: 2*(UIScreen.main.bounds.size.width/3), height: CGFloat.greatestFiniteMagnitude)
        
        let nameHeight = height(forText: message.senderUsername, fontSize: 10, maxSize:maxSize)
        let messageHeight = height(forText: message.messageContent, fontSize: 17, maxSize: maxSize)
        
        return nameHeight + messageHeight + 32 + 16
    }
}
