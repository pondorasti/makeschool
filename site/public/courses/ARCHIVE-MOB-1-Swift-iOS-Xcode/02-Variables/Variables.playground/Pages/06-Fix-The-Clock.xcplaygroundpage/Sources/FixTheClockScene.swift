//
//  FixTheClockScene.swift
//  L01-Variables
//
//  Created by Dion Larson.
//  Copyright © 2016 Make School. All rights reserved.
//


import SpriteKit

let blockCategory: UInt32 = 1 << 1

func degreesToRadians(degrees: Int) -> CGFloat {
    return CGFloat(Double(degrees) * M_PI / 180)
}

public class FixTheClockScene: SKScene, SKPhysicsContactDelegate {
    
    var instructions: SKLabelNode?
    var timeLabel: SKLabelNode?
    var hourHand: SKNode?
    var minuteHand: SKNode?
    var secondHand: SKNode?
    
    var hours = 12
    var minutes = 0
    var seconds = 0
    var hourRotation = 0
    var minuteRotation = 0
    var secondRotation = 0
    
    override public func didMove(to view: SKView) {
        instructions = childNode(withName: "instructions") as? SKLabelNode
        
        let timeString = "\(String(format: "%02d", hours)):\(String(format: "%02d", minutes)):\(String(format: "%02d", seconds))"
        
        timeLabel = childNode(withName: "timeLabel") as? SKLabelNode
        timeLabel?.text = "The time is \(timeString)"
        
        let clock = childNode(withName: "clock")!
        
        hourHand = clock.childNode(withName: "hourHand")
        hourHand?.zRotation = -degreesToRadians(degrees: hourRotation)
        
        minuteHand = clock.childNode(withName: "minuteHand")
        minuteHand?.zRotation = -degreesToRadians(degrees: minuteRotation)
        
        secondHand = clock.childNode(withName: "secondHand")
        secondHand?.zRotation = -degreesToRadians(degrees: secondRotation)
        
        let correctHourRotation = Int(Double(hours) / 12 * 360)
        let correctMinuteRotation = Int(Double(minutes) / 60 * 360)
        let correctSecondRotation = Int(Double(seconds) / 60 * 360)
        
        if correctHourRotation == hourRotation &&
            correctMinuteRotation == minuteRotation &&
            correctSecondRotation == secondRotation {
                instructions?.text = "Success!"
        }
    }
    
    public class func setup(hours: Int, minutes: Int, seconds: Int, hourRotation: Int, minuteRotation: Int, secondRotation: Int) -> SKView {
        let sceneView = SKView(frame: CGRect(x: 0, y: 0, width: 320, height: 568))
        sceneView.wantsLayer = true
        let scene = FixTheClockScene(fileNamed: "FixTheClockScene")!
        
        scene.scaleMode = .aspectFill
        
        scene.hours = hours
        scene.minutes = minutes
        scene.seconds = seconds
        scene.hourRotation = hourRotation
        scene.minuteRotation = minuteRotation
        scene.secondRotation = secondRotation
        
        sceneView.presentScene(scene)
        return sceneView
    }
}
