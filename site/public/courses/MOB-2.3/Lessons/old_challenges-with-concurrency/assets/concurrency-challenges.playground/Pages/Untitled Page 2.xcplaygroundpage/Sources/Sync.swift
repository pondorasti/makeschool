import Foundation


public func syncResource<R>(_ m: inout pthread_mutex_t, execute: () -> R) -> R {
    pthread_mutex_lock(&m)
    defer { pthread_mutex_unlock(&m) }
    return execute()
}
