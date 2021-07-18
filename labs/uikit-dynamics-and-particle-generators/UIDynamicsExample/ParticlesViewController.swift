//
//  ParticlesViewController.swift
//  UIDynamicsExample
//
//  Created by Eliel Gordon on 5/22/18.
//  Copyright © 2018 MakeSchool. All rights reserved.
//

import UIKit

class ParticlesViewController: UIViewController {

    let rainEmitter = CAEmitterLayer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        rainEmitter.emitterPosition = CGPoint(x: view.frame.size.width / 2.0, y: 0)
        rainEmitter.emitterShape = kCAEmitterLayerLine
        rainEmitter.emitterSize = CGSize(width: view.frame.size.width, height: 1)
        
        rainEmitter.emitterCells = (0...5).map(generateRainCell)
        
        view.layer.addSublayer(rainEmitter)
    }
    
    func generateRainCell(index: Int) -> CAEmitterCell {
        let cell = CAEmitterCell()
        let intensity: Float = log(Float(index))
        
        cell.birthRate = 6.0 * intensity
        cell.lifetime = 14.0 * intensity
        cell.lifetimeRange = 1
        cell.velocity = CGFloat(350.0 * intensity)
        cell.velocityRange = CGFloat(80.0 * intensity)
        cell.emissionLongitude = .pi
        cell.emissionRange = .pi / 43
        cell.spin = CGFloat(0.6)
        cell.spinRange = 0.8
        cell.scale = 0.15
        cell.scaleRange = CGFloat(log(intensity))
        cell.scaleSpeed = CGFloat(-0.1 * intensity)
        cell.contents = UIImage(named: "coin")!.cgImage
        
        return cell
    }
}
