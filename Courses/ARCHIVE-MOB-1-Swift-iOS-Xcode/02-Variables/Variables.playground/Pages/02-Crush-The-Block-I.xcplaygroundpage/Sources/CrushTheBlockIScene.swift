//
//  CrushTheBlockIScene.swift
//  L01-Variables
//
//  Created by Dion Larson.
//  Copyright © 2016 Make School. All rights reserved.
//


import SpriteKit

let blockCategory: UInt32 = 1 << 1

public class CrushTheBlockIScene: SKScene, SKPhysicsContactDelegate {
    
    public var crusherPosition = 0
    public var crusher: SKNode?
    var crushee: SKNode?
    var crushedAnimation: SKNode?
    var instructions: SKLabelNode?
    var animation: SKSpriteNode?
    
    override public func didMove(to view: SKView) {
        physicsWorld.contactDelegate = self
        
        crusher = childNode(withName: "crusher")
        crusher?.physicsBody?.contactTestBitMask = blockCategory
        
        crusher?.position = CGPoint(x: CGFloat(crusherPosition), y: 480)
        
        crushee = childNode(withName: "crushee")
        crushee?.physicsBody?.contactTestBitMask = blockCategory
        
        crushedAnimation = childNode(withName: "crushedAnimation")
        animation = SKSpriteNode(fileNamed: "crushed.sks")!
        
        instructions = childNode(withName: "instructions") as? SKLabelNode
    }
    
    public func didBegin(_ contact: SKPhysicsContact) {
        if contact.bodyA.contactTestBitMask == blockCategory && contact.bodyB.contactTestBitMask == blockCategory && instructions?.text != "Success!" {
            crushee?.removeFromParent()
            
            if let animation = animation {
                let child = animation.childNode(withName: "animation")!
                child.removeFromParent()
                crushedAnimation?.addChild(child)
            }
            
            instructions?.text = "Success!"
        }
    }
    
    public class func setup(crusherPosition: Int) -> SKView {
        let sceneView = SKView(frame: CGRect(x: 0, y: 0, width: 320, height: 568))
        sceneView.wantsLayer = true
        let scene = CrushTheBlockIScene(fileNamed: "CrushTheBlockIScene")!
        scene.scaleMode = .aspectFill
        
        scene.crusherPosition = crusherPosition
        
        sceneView.presentScene(scene)
        return sceneView
    }
}
