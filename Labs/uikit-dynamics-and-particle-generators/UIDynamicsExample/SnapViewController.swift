//
//  SnapViewController.swift
//  UIDynamicsExample
//
//  Created by Eliel Gordon on 5/22/18.
//  Copyright © 2018 MakeSchool. All rights reserved.
//

import UIKit

class SnapViewController: UIViewController {

    @IBOutlet weak var snapView: UIView!
    
    var animator: UIDynamicAnimator!
    var snap: UISnapBehavior!
    var snapViewBehavior: UIDynamicItemBehavior!
    var panGesture: UIPanGestureRecognizer!
    var show = false
    
    let cardView = SnapView(
        frame: CGRect(x: 0, y: 0, width: 350, height: 250)
    )
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        cardView.center = view.center
        cardView.center.y = -300
        
        panGesture = UIPanGestureRecognizer(
            target: self,
            action: #selector(handlePan)
        )
        
        animator = UIDynamicAnimator(referenceView: view)
        snap = UISnapBehavior(item: cardView, snapTo: view.center)
        snap.damping = 0.9
        
        animator.addBehavior(snap)
        cardView.addGestureRecognizer(panGesture)
        // Do any additional setup after loading the view.
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(cardView)
    }
    
    @objc func handlePan(recognizer: UIPanGestureRecognizer)  {
        switch recognizer.state {
        case .changed:
            let translation = recognizer.translation(in: view)
            let translatedPoint = CGPoint(x: cardView.center.x + translation.x, y: cardView.center.y + translation.y)
            cardView.center = translatedPoint
            
            recognizer.setTranslation(.zero, in: view)
        case .ended, .cancelled, .failed:
            animator.addBehavior(snap)
        case .possible:
            break
        case .began:
            animator.removeBehavior(snap)
        }
    }
    
    @IBAction func showHidePressed(_ sender: UIButton) {
        
        if show {
            snap.snapPoint = view.center
            show = false
            sender.setTitle("Hide", for: .normal)
        }else {
            snap.snapPoint = CGPoint(x: view.center.x, y: -300)
            show = true
            sender.setTitle("Show", for: .normal)
        }
    }
}
