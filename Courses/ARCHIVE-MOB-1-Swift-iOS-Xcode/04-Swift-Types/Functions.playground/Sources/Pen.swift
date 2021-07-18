import SpriteKit

open class ShapeNodeData {
    let path: NSBezierPath
    let color: NSColor
    var numberOfPoints = 0
    
    init(startPoint: CGPoint, thickness: Double, color: NSColor) {
        self.path = NSBezierPath()
        self.path.lineJoinStyle = .roundLineJoinStyle
        self.path.lineCapStyle = .roundLineCapStyle
        self.path.move(to: startPoint)
        self.path.lineWidth = CGFloat(thickness)
        self.color = color
    }
}

open class Pen {
    open static let sharedInstance = Pen()
    open static var delay: Double = 1
    
    open var processing = true {
        didSet {
            if !processing {
                newShapeNode()
            }
        }
    }
    
    open var currentShapeData: ShapeNodeData!
    open var penIsDown = true
    open var speed: useconds_t = 50000
    open var position = CGPoint(x: 160, y: 288)
    open var rotation: CGFloat = CGFloat.pi
    
    var shapeNodes = [ShapeNodeData?]()
    
    open var thickness = 1.0 {
        didSet {
            newShapeNode()
        }
    }
    
    open var color = SKColor.blue {
        didSet {
            newShapeNode()
        }
    }
    
    init() {
        newShapeNode()
    }
    
    open func penDown() {
        if penIsDown { return }
        penIsDown = true
        newShapeNode()
    }
    
    open func penUp() {
        if !penIsDown { return }
        penIsDown = false
    }
    
    open func moveTenSteps() {
        move(10)
    }
    
    open func rotateNintyDegrees() {
        rotate(90)
    }
    
    open func move(_ steps: Int) {
        let oldPosition = position
        position = position + CGPoint(angle: (rotation + π / 2)) * CGFloat(steps)
        moved(from: oldPosition, to: position)
    }
    
    open func moveTo(x: Int, y: Int) {
        moveTo(x: Double(x), y: Double(y))
    }
    
    open func moveTo(x: Double, y: Double) {
        let oldPosition = position
        position = CGPoint(x: x, y: y)
        moved(from: oldPosition, to: position)
    }
    
    open func rotate(_ degrees: Int) {
        rotate(Double(degrees))
    }
    
    open func rotate(_ degrees: Double) {
        rotation = rotation + CGFloat(degrees).degreesToRadians()
        let limit = π * 2
        if rotation > limit {
            rotation -= limit
        } else if rotation < -limit {
            rotation += limit
        }
    }
    
    open func setColor(red: Double, green: Double, blue: Double) {
        color = SKColorWithRGB(Int(red*255), g: Int(green*255), b: Int(blue*255))
    }
    
    open func setColor(nsColor c: NSColor) {
        color = c
    }
    
    open func setThickness(_ thickness: Double) {
        self.thickness = thickness
    }
    
    func moved(from: CGPoint, to: CGPoint) {
        if penIsDown {
            currentShapeData.path.line(to: to)
        } else {
            currentShapeData.path.move(to: to)
        }
        currentShapeData.numberOfPoints += 1
        if speed > 0 {
            usleep(speed)
        }
    }
    
    func newShapeNode() {
        currentShapeData = ShapeNodeData(startPoint: position, thickness: thickness, color: color)
        shapeNodes.append(currentShapeData)
    }
    
}
