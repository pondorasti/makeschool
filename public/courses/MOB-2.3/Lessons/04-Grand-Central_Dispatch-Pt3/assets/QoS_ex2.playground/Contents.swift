import Foundation

let queue1 = DispatchQueue(label: "com.makeschool.queue1", qos: DispatchQoS.userInitiated)
let queue2 = DispatchQueue(label: "com.makeschool.queue2", qos: DispatchQoS.utility)

queue1.async {
    for i in 0..<10 {
        print("🍎 ", i)
    }
}

queue2.async {
    for i in 100..<110 {
        print("🐳 ", i)
    }
}

for i in 100..<110 {
    print("😬 ", i)
}
