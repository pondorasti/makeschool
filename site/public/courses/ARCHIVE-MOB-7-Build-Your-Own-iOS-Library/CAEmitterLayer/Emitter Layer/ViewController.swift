//
//  ViewController.swift
//  Emitter Layer
//
//  Created by mitchell hudson on 2/16/17.
//  Copyright © 2017 Mitchell Hudson. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let emitter = CAEmitterLayer()
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        
//        emitter.bounds = view.bounds
//        emitter.frame = view.frame
        emitter.backgroundColor = UIColor.magenta.cgColor
        emitter.birthRate = 22
        emitter.emitterShape = kCAEmitterLayerLine
        emitter.position = CGPoint(x: 200, y: 300)
        
        let cell = CAEmitterCell()
        cell.lifetime = 4
        cell.lifetimeRange = 0.8
        cell.birthRate = 1
        cell.velocity = 50
        cell.emissionLatitude = (4 * .pi) / 3
        cell.emissionLongitude = (5 * .pi) / 3
        cell.emissionRange = (4 * .pi) / 3
        cell.contents = UIImage(named: "26")!.cgImage
//         cell.color = UIColor.black.cgColor
        cell.speed = 0.3
        cell.scale = 1
        
        
        emitter.emitterCells = [cell]
        
        view.layer.addSublayer(emitter)
    }
}

