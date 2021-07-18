//
//  GameViewController.swift
//  pop-the-bubble
//
//  Created by Eliel Gordon on 8/3/18.
//  Copyright © 2018 MakeSchool. All rights reserved.
//

import UIKit
import SpriteKit
import GameplayKit

class GameViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 1. Setup our view to present our game scene
        guard let view = self.view as? SKView else {return}
        
        // 2. Create our game scene
        let gameScene = GameScene(size: self.view.frame.size)
        gameScene.scaleMode = .aspectFit
        
        // 3. Present our game scene
        view.presentScene(gameScene)
        
        // 4. Display debug info
        view.showsFPS = true
        view.showsNodeCount = true
    }

    override var shouldAutorotate: Bool {
        return true
    }

    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        if UIDevice.current.userInterfaceIdiom == .phone {
            return .allButUpsideDown
        } else {
            return .all
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Release any cached data, images, etc that aren't in use.
    }

    override var prefersStatusBarHidden: Bool {
        return true
    }
}
