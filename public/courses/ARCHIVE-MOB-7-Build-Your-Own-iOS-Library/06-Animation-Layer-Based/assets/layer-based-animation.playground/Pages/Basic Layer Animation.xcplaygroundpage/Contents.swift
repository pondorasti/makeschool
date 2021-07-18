import UIKit
import PlaygroundSupport

PlaygroundPage.current.needsIndefiniteExecution = true

let viewFrame = CGRect(x: 0, y: 0, width: 400, height: 700)
let view = UIView(frame: viewFrame)
view.backgroundColor = UIColor.white
PlaygroundPage.current.liveView = view

let anim = CABasicAnimation()

anim.fromValue = NSNumber(integerLiteral: 0)
anim.toValue = NSNumber(integerLiteral: 1)
anim.duration = 1.0
anim.keyPath = #keyPath(CAShapeLayer.strokeEnd)

let layer = CAShapeLayer()
let rect = CGRect(x: 100, y: 150, width: 200, height: 200)
let path = UIBezierPath(roundedRect: rect, cornerRadius: 8)

layer.path = path.cgPath
layer.strokeStart = 0
layer.strokeEnd = 1
layer.lineWidth = 8
layer.fillColor = UIColor.clear.cgColor
layer.strokeColor = UIColor.red.cgColor

layer.add(anim, forKey: "stroke")

view.layer.addSublayer(layer)



