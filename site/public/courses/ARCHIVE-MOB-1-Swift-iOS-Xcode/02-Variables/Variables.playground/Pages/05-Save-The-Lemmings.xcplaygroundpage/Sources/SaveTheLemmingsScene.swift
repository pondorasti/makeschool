//
//  SaveTheLemmingsScene.swift
//  L01-Variables
//
//  Created by Dion Larson.
//  Copyright © 2016 Make School. All rights reserved.
//


import SpriteKit

let blockCategory: UInt32 = 1 << 1

public class SaveTheLemmingsScene: SKScene, SKPhysicsContactDelegate {
  
  var lemming: SKNode?
  var instructions: SKLabelNode?
  var signLabel: SKLabelNode?
  var stringForSign = ""
  
  override public func didMove(to view: SKView) {
    lemming = childNode(withName: "lemming")
    
    instructions = childNode(withName: "instructions") as? SKLabelNode
    
    signLabel = childNode(withName: "signLabel") as? SKLabelNode
    signLabel?.text = stringForSign
    
    while signLabel!.frame.width > 190 {
      signLabel?.fontSize -= 0.1
    }
    
    let waitAction = SKAction.wait(forDuration: 2)
    let action: SKAction
    if stringForSign.lowercased().contains("danger") {
        action = SKAction.sequence([waitAction, SKAction.run({ () -> Void in
            self.instructions?.text = "You saved the lemmings!"
        })])
    } else {
        action = SKAction.sequence([waitAction, SKAction.run({ () -> Void in
            self.instructions?.text = "OH NO! :("
        })])
    }
    
    instructions?.run(action)
  }
  
  public class func setup(stringForSign: String) -> SKView {
    let sceneView = SKView(frame: CGRect(x: 0, y: 0, width: 320, height: 568))
    sceneView.wantsLayer = true
    let scene: SaveTheLemmingsScene
    if stringForSign.lowercased().contains("danger") {
        scene = SaveTheLemmingsScene(fileNamed: "SaveTheLemmingsSceneWin")!
    } else {
        scene = SaveTheLemmingsScene(fileNamed: "SaveTheLemmingsSceneLose")!
    }
    
    scene.scaleMode = .aspectFill
    
    scene.stringForSign = stringForSign
    
    sceneView.presentScene(scene)
    return sceneView
  }
}
