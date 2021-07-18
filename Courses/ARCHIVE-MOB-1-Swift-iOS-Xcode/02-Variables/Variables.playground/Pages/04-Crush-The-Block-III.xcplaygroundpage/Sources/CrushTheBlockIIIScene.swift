//
//  CrushTheBlockIIIScene.swift
//  L01-Variables
//
//  Created by Dion Larson.
//  Copyright © 2016 Make School. All rights reserved.
//


import SpriteKit

let blockCategory: UInt32 = 1 << 1

public class CrushTheBlockIIIScene: SKScene, SKPhysicsContactDelegate {
    
    public var crusherVelocity = 0
    public var crusher: SKNode?
    var crushee: SKNode?
    var crushedAnimation: SKNode?
    var animation: SKSpriteNode?
    var instructions: SKLabelNode?
    
    override public func didMove(to view: SKView) {
        physicsWorld.contactDelegate = self
        
        crusher = childNode(withName: "crusher")
        crusher?.physicsBody?.contactTestBitMask = blockCategory
        
        crusher?.physicsBody?.applyImpulse(CGVector(dx: CGFloat(crusherVelocity), dy: 0.0))
        
        crushee = childNode(withName: "crushee")
        crushee?.physicsBody?.contactTestBitMask = blockCategory
        
        crushedAnimation = childNode(withName: "crushedAnimation")
        animation = SKSpriteNode(fileNamed: "crushed.sks")!
        
        instructions = childNode(withName: "instructions") as? SKLabelNode
        
        let snowParticle = childNode(withName: "snowParticle") as! SKEmitterNode
        snowParticle.advanceSimulationTime(30)
    }
    
    public func didBegin(_ contact: SKPhysicsContact) {
        if contact.bodyA.contactTestBitMask == blockCategory && contact.bodyB.contactTestBitMask == blockCategory {
            crushee?.removeFromParent()
            
            if let animation = animation {
                let child = animation.childNode(withName: "animation")!
                child.removeFromParent()
                crushedAnimation?.addChild(child)
            }
            
            instructions?.text = "Success!"
        }
    }
    
    public class func setup(forceToApply crusherVelocity: Int, windSpeed: Int) -> SKView {
        let sceneView = SKView(frame: CGRect(x: 0, y: 0, width: 320, height: 568))
        sceneView.wantsLayer = true
        let scene = CrushTheBlockIIIScene(fileNamed: "CrushTheBlockIIIScene")!
        scene.scaleMode = .aspectFill
        
        scene.crusherVelocity = max(crusherVelocity - windSpeed, 0)
        
        sceneView.presentScene(scene)
        return sceneView
    }
}
