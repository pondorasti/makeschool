import Foundation
import SpriteKit

let queue = DispatchQueue(label: "Drawing", attributes: [])
var firstCommand = true

func changeDelay(delay: Double) {
    queue.async { () -> Void in
        Pen.delay = delay
    }
}

func delay() {
    if Pen.delay == 0.0 { return }
    let delay = UInt32(Pen.delay * Double(USEC_PER_SEC))
    usleep(delay)
}

func delayStart() {
    if !firstCommand { return }
    queue.async { () -> Void in
        usleep(UInt32(1.0 * Double(USEC_PER_SEC)))
    }
    firstCommand = false
}

public func penDown() {
    delayStart()
    queue.async { () -> Void in
        delay()
        Pen.sharedInstance.penDown()
    }
}

public func penUp() {
    delayStart()
    queue.async { () -> Void in
        delay()
        Pen.sharedInstance.penUp()
    }
}

public func moveFifty() {
    move(steps: 50)
}

public func move(steps: Int) {
    delayStart()
    queue.async { () -> Void in
        delay()
        Pen.sharedInstance.move(steps)
    }
}

public func moveTo(x: Int, y: Int) {
    delayStart()
    queue.async { () -> Void in
        delay()
        Pen.sharedInstance.moveTo(x: x, y: y)
    }
}

public func moveTo(x: Double, y: Double) {
    delayStart()
    queue.async { () -> Void in
        delay()
        Pen.sharedInstance.moveTo(x: x, y: y)
    }
}

public func rotateNinety() {
    rotate(degrees: 90)
}

public func rotate(degrees: Int) {
    rotate(degrees: Double(degrees))
}

public func rotate(degrees: Double) {
    delayStart()
    queue.async { () -> Void in
        delay()
        Pen.sharedInstance.rotate(degrees)
    }
}

public func setColor(red: Double, green: Double, blue: Double) {
    delayStart()
    queue.async { () -> Void in
        delay()
        Pen.sharedInstance.setColor(red: red, green: green, blue: blue)
    }
}

public func setColor(color: NSColor) {
    delayStart()
    queue.async { () -> Void in
        delay()
        Pen.sharedInstance.setColor(nsColor: color)
    }
}

public func set(thickness: Double) {
    delayStart()
    queue.async { () -> Void in
        delay()
        Pen.sharedInstance.setThickness(thickness)
    }
}
