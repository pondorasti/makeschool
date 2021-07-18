//: [Previous](@previous)

import UIKit
import PlaygroundSupport

PlaygroundPage.current.needsIndefiniteExecution = true

let viewFrame = CGRect(x: 0, y: 0, width: 500, height: 400)
let view = UIView(frame: viewFrame)
view.backgroundColor = UIColor.white
PlaygroundPage.current.liveView = view


let repLayer = CAShapeLayer()
repLayer.frame = CGRect(x: 0, y: 200, width: 6, height: 6)
repLayer.backgroundColor = UIColor.yellow.cgColor

view.layer.addSublayer(repLayer)

let replicatorLayer = CAReplicatorLayer()

replicatorLayer.frame = view.bounds
replicatorLayer.instanceCount = 30
replicatorLayer.instanceDelay = CFTimeInterval(1 / 30.0)
replicatorLayer.preservesDepth = false
replicatorLayer.instanceColor = UIColor.red.cgColor

replicatorLayer.instanceRedOffset = 0.02
replicatorLayer.instanceGreenOffset = 0.03
replicatorLayer.instanceBlueOffset = -0.01
replicatorLayer.instanceAlphaOffset = 0.0

var t = CATransform3DMakeTranslation(20, 0, 0)


t = CATransform3DMakeRotation(CGFloat(10), 0, 0, 1)

replicatorLayer.instanceTransform = t

view.layer.addSublayer(replicatorLayer)
replicatorLayer.addSublayer(repLayer)

let fadeAnimation = CABasicAnimation(keyPath: "opacity")
fadeAnimation.fromValue = 1.0
fadeAnimation.toValue = 0.0
fadeAnimation.duration = 1
fadeAnimation.repeatCount = Float.greatestFiniteMagnitude
repLayer.opacity = 0.0
repLayer.add(fadeAnimation, forKey: "FadeAnimation")
//: [Next](@next)
