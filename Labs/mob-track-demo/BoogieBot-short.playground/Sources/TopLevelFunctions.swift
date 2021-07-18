import AppKit
import PlaygroundSupport
private let bot = BoogieBot(frame:CGRect(x: 0.0, y: 0.0, width: 300, height: 500))
private let recorder = Recorder()


// NSView subclass required to support CALayer geometry with origin top left
class FlippedView: NSView {
    override var isFlipped: Bool {
        return true
    }
}

//: These top-level functions call through to the private bot and recorder instances above, to make the playground more accessible.
public func startBot() {
    let boogieView = FlippedView(frame: bot.bounds)
    boogieView.wantsLayer = true
    bot.backgroundColor = NSColor.black.cgColor
    boogieView.layer?.addSublayer(bot)
    PlaygroundPage.current.liveView = boogieView
    if let scale = boogieView.window?.backingScaleFactor {
        bot.setScale(scale)
    }
    recorder.targetView = boogieView
}

public func runBoogieBotDemoMode() {
    startBot()
    bot.runDemoMode()
}

public func startRecording() {
    recorder.recordingLayer = bot
    recorder.scale = 0.5
    recorder.startRecording()
    bot.boogieDelegate = recorder
}

public func leftArmUp() {
    bot.doMove(.leftArmUp)
}
public func leftArmDown() {
    bot.doMove(.leftArmDown)
}
public func rightArmUp() {
    bot.doMove(.rightArmUp)
}
public func rightArmDown() {
    bot.doMove(.rightArmDown)
}
public func leftLegUp() {
    bot.doMove(.leftLegUp)
}
public func leftLegDown() {
    bot.doMove(.leftLegDown)
}
public func rightLegUp() {
    bot.doMove(.rightLegUp)
}
public func rightLegDown() {
    bot.doMove(.rightLegDown)
}
public func shakeItLeft() {
    bot.doMove(.shakeItLeft)
}
public func shakeItRight() {
    bot.doMove(.shakeItRight)
}
public func shakeItCenter() {
    bot.doMove(.shakeItCenter)
}
public func jumpUp() {
    bot.doMove(.jumpUp)
}
public func jumpDown() {
    bot.doMove(.jumpDown)
}
public func fabulize() {
    bot.doMove(.fabulize)
}
public func defabulize() {
    bot.doMove(.defabulize)
}
public func setBotTitle(_ botTitle: String) {
    bot.title = botTitle
}
public func setBotSubtitle(_ subtitle: String) {
    bot.subtitle = subtitle
}

