import PlaygroundSupport
import AppKit

class BoogieBot: CALayer {
    
    // MARK: Move. Each enum case represents a move that BoogieBot can perform.
    
    enum Move {
        case leftArmUp
        case leftArmDown
        case rightArmUp
        case rightArmDown
        case leftLegUp
        case leftLegDown
        case rightLegUp
        case rightLegDown
        case shakeItLeft
        case shakeItRight
        case shakeItCenter
        case jumpUp
        case jumpDown
        case fabulize
        case defabulize
        
        // This calculated variable represents the animation key path required for each move
        var animationKeyPath: String {
            switch self {
            case .fabulize, .defabulize: return "backgroundColor"
            default: return "transform"
            }
        }
        
        // This calculated variable represents the target value of the animation for each move
        var toValue: AnyObject {
            switch self {
            case .leftArmUp:
                return NSValue(caTransform3D: CATransform3DMakeRotation(CGFloat(3.5 * Double.pi / 4), 0, 0, 1))
            case .rightArmUp:
                return NSValue(caTransform3D: CATransform3DMakeRotation(CGFloat(-3.5 * Double.pi / 4), 0, 0, 1))
            case .leftLegUp, .rightLegUp:
                return NSValue(caTransform3D: CATransform3DMakeTranslation(0, -40, 0))
            case .shakeItLeft:
                return NSValue(caTransform3D: CATransform3DMakeTranslation(-20, 0, 0))
            case .shakeItRight:
                return NSValue(caTransform3D: CATransform3DMakeTranslation(20, 0, 0))
            case .jumpUp:
                return NSValue(caTransform3D: CATransform3DMakeTranslation(0, -50, 0))
            case .leftArmDown, .leftLegDown, .rightArmDown, .rightLegDown, .shakeItCenter, .jumpDown:
                return NSValue(caTransform3D: CATransform3DIdentity)
            case .fabulize:
                return CGColor.fabulous()
            case .defabulize:
                return CGColor.unfabulous()
            }
        }
        
        // This function returns the layer(s) affected by a specific move
        func targetLayers(bot: BoogieBot) -> [CALayer] {
            switch self {
            case .leftArmUp, .leftArmDown:
                return [bot.leftArm]
            case .rightArmUp, .rightArmDown:
                return [bot.rightArm]
            case .leftLegUp, .leftLegDown:
                return [bot.leftLeg]
            case .rightLegUp, .rightLegDown:
                return [bot.rightLeg]
            case .shakeItLeft , .shakeItRight, .shakeItCenter:
                return [bot.booty]
            case .jumpUp, .jumpDown:
                return [bot.body]
            case .fabulize, .defabulize:
                return bot.parts
            }
        }
        
    }
    
    //MARK: Body parts
    // Each body part is represented by a CALayer
    private let body = CALayer()
    private let torso: CALayer = { $0.frame = CGRect(x: 100, y: 150, width: 100, height: 140); return $0 }(CALayer())
    private let booty: CALayer = { $0.frame = CGRect(x:100, y: 290, width:100, height:35); return $0 }(CALayer())
    private let head: CALayer = { $0.frame = CGRect(x:125, y:95, width:50, height:50); return $0 }(CALayer())
    private let leftArm = CALayer()
    private let leftFinger = CALayer()
    private let rightArm = CALayer()
    private let rightFinger = CALayer()
    private let leftLeg: CALayer = { $0.frame = CGRect(x:100, y: 330, width:25, height:120); return $0 }(CALayer())
    private let rightLeg: CALayer = { $0.frame = CGRect(x:175, y: 330, width:25, height:120); return $0 }(CALayer())
    fileprivate let titleLayer: CATextLayer = {
        $0.frame = CGRect(x:10, y: 50, width: 280, height: 40)
        $0.alignmentMode = .center
        $0.string = ""
        $0.fontSize = 20
        $0.foregroundColor = NSColor.white.cgColor
        return $0
    } (CATextLayer())
    fileprivate let subtitleLayer: CATextLayer = {
        $0.frame = CGRect(x:10, y: 460, width: 280, height: 40)
        $0.alignmentMode = .center
        $0.string = ""
        $0.fontSize = 12
        $0.foregroundColor = NSColor.white.cgColor
        return $0
    } (CATextLayer())
    
    // An array of the parts that represent the robot's body
    private var parts: [CALayer] {
        return [torso, booty, head, leftArm, leftFinger, rightArm, rightFinger, leftLeg, rightLeg]
    }
    
    // Initial setup and building of the robot
    fileprivate func addParts() {
        addSublayer(titleLayer)
        addSublayer(subtitleLayer)
        
        body.frame = bounds
        addSublayer(body)
        body.addSublayer(torso)
        body.addSublayer(booty)
        
        body.addSublayer(leftLeg)
        body.addSublayer(rightLeg)
        body.addSublayer(head)
        
        leftArm.anchorPoint = CGPoint(x: 0.5, y: 0)
        leftArm.frame = CGRect(x: 70, y: 150, width: 25, height: 100)
        leftFinger.frame = CGRect(x:0, y: 100, width: 5, height: 20)
        leftArm.addSublayer(leftFinger)
        leftFinger.isHidden = true
        body.addSublayer(leftArm)
        
        rightArm.anchorPoint = CGPoint(x:0.5, y:0)
        rightArm.frame = CGRect(x: 205, y: 150, width: 25, height: 100)
        rightFinger.frame = CGRect(x: 20, y: 100, width: 5, height: 20)
        rightArm.addSublayer(rightFinger)
        rightFinger.isHidden = true
        body.addSublayer(rightArm)
        parts.forEach { $0.backgroundColor = CGColor.unfabulous() }
        
    }
    
    //MARK: Demo mode
    var demoMode = false
    func runDemoMode() {
        doMove(.fabulize)
        demoMode = true
        performDemoDance()
    }
    
    private func performDemoDance() {
        doMoves([
            .leftArmUp,
            .rightArmUp,
            .shakeItLeft,
            .shakeItRight,
            .shakeItCenter,
            .leftLegUp,
            .leftLegDown,
            .rightLegUp,
            .rightLegDown,
            .rightArmDown,
            .leftArmDown,
            .leftArmDown,
            .fabulize
            ])
    }
    
    // MARK: Captions and titles
    var title: String {
        get {
            return (titleLayer.string as? String) ?? ""
        }
        set {
            titleLayer.string = newValue
        }
    }
    
    var subtitle: String {
        get {
            return (subtitleLayer.string as? String) ?? ""
        }
        set {
            subtitleLayer.string = newValue
        }
    }

    // MARK: Dancing animations
    private let moveDuration: TimeInterval = 0.25
    
    private var isDancing = false
    private var moveQueue = [[Move]]() {
        didSet {
            // This property observer is called whenever the move queue is changed.
            // doNextMove will be called when each move completes, 
            // so it should only be called here if the bot is not already dancing.
            if !isDancing {
                isDancing = true
                doNextMove()
            }
        }
    }
    
    // Adds a single move to the queue
    func doMove(_ move:Move) {
        moveQueue.append([move])
    }
    
    // Adds multiple moves to the queue
    func doMoves(_ moves:[Move]) {
        for move in moves {
            moveQueue.append([move])
        }
    }
    
    // Adds several moves to the queue, to be performed together
    func doMovesTogether(_ moves:[Move]) {
        moveQueue.append(moves)
    }
    
    // Starts the next move, if one is available
    fileprivate func doNextMove() {
        guard !moveQueue.isEmpty else {
            movesFinished()
            return
        }
        let moves = moveQueue.removeFirst()
        animate(moves:moves)
    }
    
    // Animates the next set of moves. Each move in the moves argument will be performed at the same time.
    private func animate(moves:[Move]) {
        
        // For multiple animations, only the first one needs to inform on completion. 
        // This flag tracks if a delegate has been assigned yet.
        var delegateAssigned = false
        for move in moves {
            
            for layer in move.targetLayers(bot: self) {
                
                let animation = CABasicAnimation(keyPath: move.animationKeyPath)
                if !delegateAssigned {
                    animation.delegate = self
                    delegateAssigned = true
                }
                animation.fromValue = layer.value(forKey: animation.keyPath!)
                animation.duration = moveDuration
                animation.toValue = move.toValue
                animation.timingFunction = CAMediaTimingFunction(name: .linear)
                layer.setValue(animation.toValue, forKey: animation.keyPath!)
                layer.add(animation, forKey: animation.keyPath)
            }
            
            switch move {
            case .leftArmUp: leftFinger.isHidden = false
            case .leftArmDown: leftFinger.isHidden = true
            case .rightArmUp: rightFinger.isHidden = false
            case .rightArmDown: rightFinger.isHidden = true
            default: break
            }
        }
    }
    
    var boogieDelegate: BoogieBotDelegate?
    
    
    func movesFinished() {
        isDancing = false
        boogieDelegate?.dancingFinished(bot: self)
        if demoMode {
            performDemoDance()
        }
    }
}

// MARK: Initializer
extension BoogieBot {
    convenience init(frame: CGRect) {
        self.init()
        self.frame = frame
        addParts()
    }
}

// MARK: Text support
extension BoogieBot {
    func setScale(_ scale: CGFloat) {
        titleLayer.contentsScale = scale
        subtitleLayer.contentsScale = scale
    }
}

// MARK: CAAnimationDelegate

extension BoogieBot: CAAnimationDelegate {
    func animationDidStop(_ anim: CAAnimation, finished flag: Bool) {
        doNextMove()
    }
}

// MARK: Color Generation

extension CGColor {
    class func fabulous() -> CGColor {
        let hue = CGFloat(arc4random_uniform(255)) / 255.0
        return NSColor(calibratedHue: hue, saturation: 1.0, brightness: 1.0, alpha: 1.0).cgColor
    }
    class func unfabulous() -> CGColor {
        return NSColor.gray.cgColor
    }
}

// Instances conforming to this protocol can be told when the bot has finished dancing
protocol BoogieBotDelegate {
    func dancingFinished(bot: BoogieBot)
}







