//: A SpriteKit based Playground

import PlaygroundSupport
import SpriteKit
import Foundation

class GameScene: SKScene {
    
    let blueNode = SKSpriteNode()
    let redNode = SKSpriteNode()

    override init(size:CGSize) {
        super.init(size:size)
        start()
    }
    
    required init(coder aDecoder: NSCoder) {
        super.init()
        fatalError("init(coder:) has not been implemented")
    }
    
    func start() {
        blueNode.color = UIColor.blue
        blueNode.size = CGSize(width: 50, height: 50)
        blueNode.position = CGPoint(
            x: 50, y: 50)
        blueNode.name = "blueNode"
        self.addChild(blueNode)
        
        redNode.color = UIColor.red
        redNode.size = CGSize(width: 50, height: 50)
        redNode.position = CGPoint(
            x: 200, y: 50)
        redNode.name = "redNode"
        self.addChild(redNode)
        
        let move = SKAction.moveBy(x: 300, y: 0, duration: 5)
        blueNode.run(move)
    }
    
    override func update(_ currentTime: TimeInterval) {
    }
  
    override func didEvaluateActions() {
        checkCollisions()
    }
    
    func collision(with node: SKSpriteNode) {
        print("Hey something just happened!")
    }
    
    func checkCollisions() {
        var hits: [SKSpriteNode] = []
        self.enumerateChildNodes(withName: "redNode") { node, _ in
            let redNode = node as! SKSpriteNode
            if redNode.frame.intersects(self.blueNode.frame) {
                hits.append(redNode)
            }
        }
        
        for node in hits {
            collision(with: node)
        }
    }

}


let frame = CGRect(x: 0, y: 0, width: 400, height: 400)
let view = SKView(frame: frame)
let scene = GameScene(size: frame.size)
scene.scaleMode = .aspectFill
view.presentScene(scene)
    
// Scene properties
view.showsPhysics = false
view.ignoresSiblingOrder = true
view.showsFPS = true
view.showsNodeCount = true

PlaygroundPage.current.liveView = view





