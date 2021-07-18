import Foundation

public func brakeHard() {
    if !GameScene.carChanged {
        GameScene.car.carSpeed -= 2
        GameScene.carChanged = true
    }
}

public func accelerateHard() {
    if !GameScene.carChanged {
        GameScene.car.carSpeed += 2
        GameScene.carChanged = true
    }
}