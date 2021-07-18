//
//  ViewController.swift
//  UIDynamicsExample
//
//  Created by Eliel Gordon on 5/21/18.
//  Copyright © 2018 MakeSchool. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var attachButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(cardView)
    }

    let cardView = UIView(
        frame: CGRect(x: 0, y: 0, width: 100, height: 100)
    )
    var animator: UIDynamicAnimator!
    var snapping: UISnapBehavior!
    var attachment: UIAttachmentBehavior!
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        
        animator = UIDynamicAnimator(referenceView: view)
        snapping = UISnapBehavior(item: cardView, snapTo: view.center)
        attachment = UIAttachmentBehavior(item: attachButton, attachedToAnchor: CGPoint(x: view.center.x, y: 0))
        attachment.length = 200
        attachment.damping = 0.6
        
        
        snapping.damping = 0.8
        animator.addBehavior(snapping)
//        animator.addBehavior(attachment)
        
        cardView.center = view.center
        cardView.backgroundColor = UIColor.red
        cardView.isUserInteractionEnabled = true
        
        
        let panG = UIPanGestureRecognizer(target: self, action: #selector(handlePan))
        //let item = UIDynamicItem()
        
        
//        cardView.addGestureRecognizer(panG)
        attachButton.addGestureRecognizer(panG)
    }
    
    @objc func handlePan(recognizer: UIPanGestureRecognizer) {
        switch recognizer.state {
        case .changed:
            let translation = recognizer.translation(in: view)
            let translatedPoint = CGPoint(x: attachButton.center.x + translation.x, y: attachButton.center.y + translation.y)
            
//            cardView.center = translatedPoint
            attachButton.center = translatedPoint
            
            recognizer.setTranslation(.zero, in: view)
        case .ended, .cancelled, .failed:
            animator.addBehavior(snapping)
            animator.addBehavior(attachment)
        case .possible:
            break
        case .began:
            animator.removeBehavior(snapping)
            animator.removeBehavior(attachment)
        }
    }

}

