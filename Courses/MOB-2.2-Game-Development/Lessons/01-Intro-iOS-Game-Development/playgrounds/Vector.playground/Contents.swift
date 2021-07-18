import UIKit

/* Calculate vector length: using CGPoint */
let vector = CGPoint(x: 5, y: 7)
let length = sqrt(vector.x * vector.x + vector.y * vector.y)

print(length) // 8.602325267042627



/* Calculate vector length: using CGVector  */
let myVector = CGVector(dx: 4, dy: 5)

let myVectorLength = sqrt(myVector.dx * myVector.dx + myVector.dy * myVector.dy)

print(myVectorLength) // 6.4031242374328485



/* Calculate vector length: using CGVector - AND extending it to add a length property */

// Add a read-only 'length' property to all CGVectors
extension CGVector {
    var length : Double {
        
        get {
            let dx = Double(self.dx)
            let dy = Double(self.dy)
            
            return sqrt(dx * dx +
                dy * dy)
        }
    }
}

print(myVector.length) // 6.4031242374328485



/* Vector Translation (summing vector components) */
let startingPosition = CGPoint(x: 1, y: 4)
let velocity = CGPoint(x: 2, y: 3)

let newPosition = CGPoint(x: startingPosition.x + velocity.x,
                          y: startingPosition.y + velocity.y)
print(newPosition) // (3.0, 7.0)
