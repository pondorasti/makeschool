//
//  Meteor.swift
//  AstroJunk
//
//  Created by Adriana González Martínez on 7/15/19.
//  Copyright © 2019 Adriana González Martínez. All rights reserved.
//

import UIKit
import SpriteKit

enum MeteorType: String, CaseIterable {
    case small = "meteor-small"
    case big = "meteor-big"
    case bigBrown = "meteor-big-brown"
}

class Meteor: SKSpriteNode {
   
    init() {
        
        let meteorType = MeteorType.allCases.randomElement()!
        let texture = SKTexture(imageNamed: meteorType.rawValue)
        let size = texture.size()
        let color = UIColor.clear
        
        super.init(texture: texture, color: color, size: size)
        
        self.name = "meteor"
        
    }
    
    required init?(coder aDecoder: NSCoder) { fatalError("init(coder:) has not been implemented")
        
    }
    
    func startMoving(bottomLimit: CGFloat){
        let spin = SKAction.rotate(byAngle: 10, duration: 3)
        let repeatSpin = SKAction.repeatForever(spin)
        self.run(repeatSpin)
        let moveDown = SKAction.move(to: CGPoint(x: self.position.x, y: bottomLimit), duration: 6)
        let remove = SKAction.removeFromParent()
        let sequence = SKAction.sequence([moveDown, remove])
        self.run(sequence)
    }
}
