import Foundation

public func duration(_ block: () -> ()) -> TimeInterval {
    let startTime = Date()
    block()
    return Date().timeIntervalSince(startTime)
}
