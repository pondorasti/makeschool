//
//  PushViewController.swift
//  UIDynamicsExample
//
//  Created by Eliel Gordon on 5/22/18.
//  Copyright © 2018 MakeSchool. All rights reserved.
//

import UIKit

class PushViewController: UIViewController {
    @IBOutlet weak var coin: UIImageView!
    @IBOutlet weak var character: UIButton!
    var animator: UIDynamicAnimator!
    var push: UIPushBehavior!
    var collision: UICollisionBehavior!
    var gravity: UIGravityBehavior!
    var characterBehavior: UIDynamicItemBehavior!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        animator = UIDynamicAnimator(referenceView: view)
        push = UIPushBehavior(items: [character], mode: .instantaneous)
        push.angle = 0
        push.magnitude = 0
        
        collision = UICollisionBehavior(items: [character, coin])
        collision.translatesReferenceBoundsIntoBoundary = true
        collision.collisionDelegate = self
        
        gravity = UIGravityBehavior(items: [character])
        gravity.magnitude = 5

        characterBehavior = UIDynamicItemBehavior(items: [character])
        characterBehavior.allowsRotation = false
        
        
        animator.addBehavior(characterBehavior)
        animator.addBehavior(gravity)
        animator.addBehavior(collision)
        animator.addBehavior(push)
    }

    @IBAction func characterPressed(_ sender: Any) {
        push.pushDirection = .init(dx: 25, dy: -15)
        push.angle = (5 * .pi) / 4
        push.active = true
    }
}

extension PushViewController: UICollisionBehaviorDelegate {
    func collisionBehavior(_ behavior: UICollisionBehavior, endedContactFor item1: UIDynamicItem, with item2: UIDynamicItem) {
        DispatchQueue.main.asyncAfter(deadline: .now() + .milliseconds(200)) {
            UIView.animate(withDuration: 0.25, delay: 0, options: [.curveEaseOut], animations: {
                self.coin.removeFromSuperview()
            }, completion: nil)
        }
    }
}
