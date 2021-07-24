//: [Previous](@previous)
import UIKit
import PlaygroundSupport

PlaygroundPage.current.needsIndefiniteExecution = true

let viewFrame = CGRect(x: 0, y: 0, width: 800, height: 500)
let view = UIView(frame: viewFrame)
view.backgroundColor = UIColor.white
PlaygroundPage.current.liveView = view

let shape = CAShapeLayer()
let path = UIBezierPath()

let point0 = CGPoint(x: 0, y: 350)
let point1 = CGPoint(x: 200, y: 250)
let point2 = CGPoint(x: 550, y: 400)
let point3 = CGPoint(
    x: viewFrame.maxX,
    y: point2.y - 100
)

let control0 = CGPoint(x: point0.x + 60, y: point0.y)

let control1 = CGPoint(x: point1.x - 110, y: point1.y)

let control2 = CGPoint(x: point1.x + 110, y: point1.y)
let control3 = CGPoint(x: point2.x - 110, y: point2.y)
let control4 = CGPoint(x: point2.x + 120, y: point2.y)
let control5 = CGPoint(x: point3.x - 100, y: point3.y)


path.move(to: point0)
path.addCurve(to: point1, controlPoint1: control0, controlPoint2: control1)
path.addCurve(to: point2, controlPoint1: control2, controlPoint2: control3)
path.addCurve(to: point3, controlPoint1: control4, controlPoint2: control5)

shape.path = path.cgPath
shape.strokeColor = UIColor.clear.cgColor
shape.lineWidth = 5
shape.strokeStart = 0
shape.strokeEnd = 0.2
shape.fillColor = UIColor.clear.cgColor

view.layer.addSublayer(shape)


let strokeStartAnim = CABasicAnimation()
strokeStartAnim.toValue = 0.7
strokeStartAnim.repeatCount = Float.infinity
strokeStartAnim.keyPath = #keyPath(CAShapeLayer.strokeStart)

let strokeEndAnim = CABasicAnimation()
strokeEndAnim.toValue = 1
strokeEndAnim.repeatCount = Float.infinity
strokeEndAnim.keyPath = #keyPath(CAShapeLayer.strokeEnd)

let groupAnim = CAAnimationGroup()
groupAnim.animations = [strokeStartAnim, strokeEndAnim]
groupAnim.duration = 3.5
groupAnim.beginTime = 0
groupAnim.speed = 1
groupAnim.autoreverses = true
groupAnim.repeatCount = .greatestFiniteMagnitude
//shape.add(groupAnim, forKey: "groupAnimation")


let trackLayer = CAShapeLayer()
trackLayer.fillColor = UIColor.blue.cgColor
trackLayer.backgroundColor = UIColor.blue.cgColor
trackLayer.frame = CGRect(origin: point0, size: CGSize(width: 12, height: 8))

let keyFrameAnim = CAKeyframeAnimation()
keyFrameAnim.path = path.cgPath
keyFrameAnim.keyPath = #keyPath(CAShapeLayer.position)
keyFrameAnim.isRemovedOnCompletion = true
keyFrameAnim.duration = 3
keyFrameAnim.calculationMode = kCAAnimationLinear
keyFrameAnim.repeatCount = Float(Int.max)

shape.addSublayer(trackLayer)
trackLayer.add(keyFrameAnim, forKey: "keyframe")


//: [Next](@next)
