//
//  GameScene.swift
//  AstroJunk
//
//  Created by Adriana González Martínez on 7/15/19.
//  Copyright © 2019 Adriana González Martínez. All rights reserved.
//

import SpriteKit
import GameplayKit
import Foundation

class GameScene: SKScene {
    
    //MARK: Properties
    var livesCount = 3
    var scoreCount = 0
    var playableRect: CGRect
    var cameraRect : CGRect {
        let x = cameraNode.position.x - size.width/2 + (size.width - playableRect.width)/2
        let y = cameraNode.position.y - size.height/2 + (size.height - playableRect.height)/2
        return CGRect(x: x, y: y,width: playableRect.width, height: playableRect.height)
    }
    var ship : Spaceship!
    let spaceshipMovePointsPerSec: CGFloat = 2.5
    let cameraMovePointsPerSec: CGFloat = 0.6
    var velocity = CGPoint.zero
    var shipMoves = false
    var shipGoesRight = false
    let cameraNode = SKCameraNode()
    let livesLabel = SKLabelNode(fontNamed: "Spaceship Bullet")
    let scoreLabel = SKLabelNode(fontNamed: "Spaceship Bullet")

    //MARK: Initializing Scene

    override init(size: CGSize) {
        playableRect = CGRect(x: 0, y: 0, width: size.width, height: size.height)
        super.init(size: size)
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented") // 6
    }
   
    override func didMove(to view: SKView) {
        createBackground()
        createSpaceship()
        createMeteorsAndDebris()
        
        addChild(cameraNode)
        camera = cameraNode
        cameraNode.position = CGPoint(x: size.width/2, y: size.height/2)
        
        livesLabel.text = "lives: \(livesCount)"
        livesLabel.fontColor = SKColor.white
        livesLabel.fontSize = 26
        livesLabel.zPosition = 150
        livesLabel.horizontalAlignmentMode = .left
        livesLabel.verticalAlignmentMode = .top
        livesLabel.position = CGPoint(
            x: -playableRect.size.width/2 + CGFloat(20), y: playableRect.size.height/2 - CGFloat(50))
        cameraNode.addChild(livesLabel)
        
        scoreLabel.text = "score: \(livesCount)"
        scoreLabel.fontColor = SKColor.white
        scoreLabel.fontSize = 26
        scoreLabel.zPosition = 150
        scoreLabel.horizontalAlignmentMode = .left
        scoreLabel.verticalAlignmentMode = .top
        scoreLabel.position = CGPoint(
            x: -playableRect.size.width/2 + CGFloat(20), y: playableRect.size.height/2 - CGFloat(80))
        cameraNode.addChild(scoreLabel)
        
    }
    
    override func update(_ currentTime: TimeInterval) {
        
        if(shipMoves){ //It moves when touches begin
            if(shipGoesRight){
                move(sprite: ship, velocity: CGPoint(x: spaceshipMovePointsPerSec, y: 0))
            }else{
                move(sprite: ship, velocity: CGPoint(x: -spaceshipMovePointsPerSec, y: 0))
            }
        }
        boundsCheckSpaceship()
        moveCamera()
        livesLabel.text = "lives: \(livesCount)"
        scoreLabel.text = "score: \(scoreCount)"

    }
    
    override func didEvaluateActions() {
        checkCollisions()
    }
    
    //MARK: Creating assets
    
    func createBackground(){
        /*let background = SKSpriteNode(imageNamed: "background")
        background.zPosition = -1
        background.size = UIScreen.main.bounds.size
        background.position = CGPoint(x: frame.size.width / 2, y: frame.size.height / 2)
        addChild(background)*/
        
        /*let background = backgroundNode()
        background.anchorPoint = CGPoint.zero
        background.position = CGPoint.zero
        background.size = UIScreen.main.bounds.size
        background.name = "background"
        background.zPosition = -1
        addChild(background)*/
        
        for i in 0...1 {
            let background = backgroundNode()
            background.anchorPoint = CGPoint.zero
            background.position = CGPoint(x: 0, y: CGFloat(i)*background.size.height)
            background.name = "background"
            background.zPosition = -1
            addChild(background)
        }
    }
    
    func createSpaceship(){
        ship = Spaceship()
        ship.position.x = (self.scene?.frame.size.width)!/2
        ship.position.y = (self.scene?.frame.size.height)!/4
        addChild(ship)
        addTrail(name: "Fire")
    }
    
    func createMeteorsAndDebris(){

        let waitAction = SKAction.wait(forDuration: 2)
        let createMeteors = SKAction.run {
           if Bool.random(){
                let item = Meteor()
                item.position.x = CGFloat.random(in: 0..<(self.scene?.frame.size.width)!)
                item.position.y = self.cameraRect.origin.y + (self.scene?.frame.size.height)!
                self.addChild(item)
                item.startMoving(bottomLimit:self.cameraRect.origin.y)
            }else{
                let item = Debris()
                item.position.x = CGFloat.random(in: 0..<(self.scene?.frame.size.width)!)
                item.position.y = self.cameraRect.origin.y + (self.scene?.frame.size.height)!
                self.addChild(item)
                item.startMoving(bottomLimit:self.cameraRect.origin.y)
           }
            
        }
        let creationSequence = SKAction.sequence([waitAction, createMeteors])
        let repeatCreation = SKAction.repeatForever(creationSequence)
        self.run(repeatCreation)
    }
    
    func boundsCheckSpaceship() {
        let bottomLeft = CGPoint(x: ship.size.width/2, y: 0)
        let bottomRight = CGPoint(x: size.width - ship.size.width/2, y: 0)
        
        if ship.position.x <= bottomLeft.x { ship.position.x = bottomLeft.x }
        if ship.position.x >= bottomRight.x { ship.position.x = bottomRight.x }
    }
    
    func backgroundNode() -> SKSpriteNode {
        // 1
        let backgroundNode = SKSpriteNode()
        backgroundNode.anchorPoint = CGPoint.zero
        backgroundNode.name = "background"
        // 2
        let background1 = SKSpriteNode(imageNamed: "background")
        background1.anchorPoint = CGPoint.zero
        background1.position = CGPoint(x: 0, y: 0)
        background1.size = UIScreen.main.bounds.size
        backgroundNode.addChild(background1)
        // 3
        let background2 = SKSpriteNode(imageNamed: "background")
        background2.anchorPoint = CGPoint.zero
        background2.position = CGPoint(x: 0, y: background1.size.height)
        background2.size = UIScreen.main.bounds.size
        backgroundNode.addChild(background2)
        // 4
        backgroundNode.size = CGSize(width: background1.size.width , height: background1.size.height + background2.size.height)
        return backgroundNode
    }

    //MARK: Touches and Movements

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            let location = touch.location(in: self)
            if location.x <= (self.scene?.frame.size.width)!/2{
                //spaceship goes left
                shipMoves = true
                shipGoesRight = false
            }else{
                //spaceship goes right
                shipMoves = true
                shipGoesRight = true
            }
        }
    }
    
    func move(sprite: SKSpriteNode, velocity: CGPoint) {
        let amountToMove = CGPoint(x: velocity.x, y: velocity.y)
        sprite.position = CGPoint(x: sprite.position.x + amountToMove.x, y: sprite.position.y + amountToMove.y)
    }
    
    func moveCamera() {
        cameraNode.position.y += cameraMovePointsPerSec
        ship.position.y = cameraNode.position.y - 200
        enumerateChildNodes(withName: "background") { node, _ in let background = node as! SKSpriteNode
            if background.position.y + background.size.height <
                self.cameraRect.origin.y {
                background.position = CGPoint(
                x: background.position.x,
                y: background.position.y + background.size.height*2) }
        }
    }
    
    //MARK: Collisions
    
    func checkCollisions() {
        var hitDebris: [SKSpriteNode] = []
        var hitMeteors: [SKSpriteNode] = []

        enumerateChildNodes(withName: "debris") { node, _ in
            let debris = node as! SKSpriteNode
            if debris.frame.intersects(self.ship.frame) {
                hitDebris.append(debris)
                self.scoreCount = self.scoreCount + 1
            }
        }
        
        for debris in hitDebris {
            self.ship.collides(with: debris)
        }
        
        enumerateChildNodes(withName: "meteor") { node, _ in
            let meteor = node as! SKSpriteNode
            if meteor.frame.intersects(self.ship.frame) {
                hitMeteors.append(meteor)
                self.livesCount = self.livesCount - 1
            }
        }
        
        for meteor in hitMeteors {
            self.ship.collides(with: meteor)
            addExplosionTrail()
        }
    }
    
    // MARK: Particles
    
    func addTrail(name: String){
        let trail = SKEmitterNode(fileNamed: name)!
        trail.zPosition = 0
        trail.position = CGPoint(x: 0, y: -ship.frame.size.height/2)
        trail.targetNode = ship
        ship.addChild(trail)
    }
    
    func addExplosionTrail(){
        let trail = SKEmitterNode(fileNamed: "Explosion")!
        trail.zPosition = 0
        trail.position = CGPoint(x: 0, y: ship.frame.size.height/2)
        trail.targetNode = ship
        ship.addChild(trail)
        trail.numParticlesToEmit = 20
        let wait = SKAction.wait(forDuration: 1)
        let remove = SKAction.removeFromParent()
        trail.run(SKAction.sequence([wait,remove]))
    }
}


