//
//  GravityViewController.swift
//  UIDynamicsExample
//
//  Created by Eliel Gordon on 5/21/18.
//  Copyright © 2018 MakeSchool. All rights reserved.
//

import UIKit

class GravityViewController: UIViewController {

    @IBOutlet weak var basketBallImage: UIImageView!
    var animator: UIDynamicAnimator!
    var bounceBehavior: UIDynamicItemBehavior!
    var gravityBehavior: UIGravityBehavior!
    var collisionBehaviour: UICollisionBehavior!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        animator = UIDynamicAnimator(referenceView: view)
        
        gravityBehavior = UIGravityBehavior(items: [basketBallImage])
    
//        gravityBehavior.angle = .pi / 3
        gravityBehavior.magnitude = 1
        
        collisionBehaviour = UICollisionBehavior(items: [basketBallImage])
//        collisionBehaviour.translatesReferenceBoundsIntoBoundary = true
        collisionBehaviour.setTranslatesReferenceBoundsIntoBoundary(with: .zero)
        
        bounceBehavior = UIDynamicItemBehavior()
        bounceBehavior.addItem(basketBallImage)
        bounceBehavior.elasticity = 0.75
        bounceBehavior.addAngularVelocity(10, for: basketBallImage)
        
        bounceBehavior.allowsRotation = true
        
        animator.addBehavior(bounceBehavior)
        animator.addBehavior(gravityBehavior)
        animator.addBehavior(collisionBehaviour)
    }

}
