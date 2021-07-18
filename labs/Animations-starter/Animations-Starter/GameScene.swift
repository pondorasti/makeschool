//
//  GameScene.swift
//  Animations-Starter
//
//  Created by Jonathan Kopp on 9/22/19.
//  Copyright © 2019 Jonathan Kopp. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    
    override func didMove(to view: SKView) {
        //Called when the scene has been displayed
        
        //TODO: Complete animation2 and animation3
        animation1()
        //animation2()
        //animation3()
        //animation4()
    }
    
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
    }
    
    //Move square in a circle!
    func animation1() {
        print("Called")
        //Set up the squares properties
        let size = CGSize(width: 80, height: 80)
        let square = SKSpriteNode(texture: nil, color: .green, size: size)
        square.position.x = 250
        square.position.y = 500
        
        //Create the different actions
        let moveLeft = SKAction.move(to: CGPoint(x: 80, y: 250), duration: 1.0)
        let moveRight = SKAction.move(to: CGPoint(x: 250, y:  500), duration: 1.0)
        let moveUP = SKAction.move(to: CGPoint(x: 80, y:  500), duration: 1.0)
        let moveDOWN = SKAction.move(to: CGPoint(x: 250, y:  250), duration: 1.0)
        
        //Group all the actions into one sequence
        let actionSequence = SKAction.sequence([moveDOWN,moveLeft,moveUP,moveRight])
        //Have sequence repeat forever and add it to the square
        square.run(SKAction.repeatForever(actionSequence))
        //Add square to parent view
        addChild(square)
    }
    
    //Have the square fade!
    func animation2() {
        //Set up the squares properties
        
        
        //Create a fade action that reduces the sqaures alpha levels
        //Create a fade action that increases the squares alpha levels
        
        //Create a sequence of the two actions and have it repeat forever
        //Add sqaure to the parentView
    }
    
    
    //Move sqaure down and increase the height
    func animation3() {
        //Set up the squares properties
        
        
        //Create an action that moves the squares y value down
        //Create an action that increases the squares sie
        
        //Create a sequence of the two actions and have it repeat forever]
        //Add sqaure to the parentView
    }
    
    //Create your own animation!
    func animation4() {
        
    }
}
