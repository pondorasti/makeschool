## Implementing the mediator pattern

The playground code below is not complete...

When completed, it will loosely emulate a common real-world scenario in which various categories of "peers" communicate across the same system.

The seeks to implement the Mediator pattern by:

- creating Colleague and Mediator protocols
- creating a base implementation class that conforms to the Colleague protocol, and creating classes/objects by extending that base classes
- creating an implementation of a class that conforms to the Mediator protocol to coordinate communication between disparate peer objects
- using a Client object to make message requests, through the mediator, for each type of peer

**TODO:** Your job is to complete the code so that its output will match the output listed in the comment below the code snippet

- __*TIP*__ All of the places where the code is incomplete are neatly marked with "//TODO:" annotation.

```swift
import UIKit

// Colleague protocol
protocol Receiver {
    associatedtype MessageType
    func receive(message: MessageType)
}

// Mediator protocol {
protocol Sender {
    associatedtype MessageType
    associatedtype ReceiverType: Receiver

    var recipients: [ReceiverType] { get }

    func send(message: MessageType)
}

// Concrete base class implementation of Colleague protocol
class Peer: Receiver {
    var name: String

    init(name: String) {
        self.name = name
    }

    func receive(message: String) {
        print("\(name) received: \(message)")
    }
}

// First Colleague class extending base Peer class
class Programmer: Peer {
    let expertise: String

    init(name: String, expertise: String) {

        //TODO: Complete init()

        super.init(name: name)
    }

    override func receive(message: String) {
        print("\(name) received: \(message) for possible \(expertise) work")
    }
}

// Another Colleague class extending base Peer class
class Recruiter: Peer {

    //TODO: add custom property required

    init(name: String, company: String) {

        //TODO: Complete init()

    }

    //TODO: Create and complete required function override
}

// Concrete implementation of Mediator protocol
final class MessageMediator: Sender {
    internal var recipients: [Peer] = []

    func add(recipient: Peer) {
        recipients.append(recipient)
    }

    func send(message: String) {
        for recipient in recipients {
            recipient.receive(message: message)
        }
    }
}

// Client
class SpamGenerator {
    func spamSpamSpamSpam(message: String, worker: MessageMediator) {
        worker.send(message: message)
    }
}

let messagesMediator = MessageMediator()
let spamGenerator = SpamGenerator()

let programmer0 = Programmer(name: "Hedy Lamar", expertise: "iOS Development")
let programmer1 = Programmer(name: "Michael Faraday", expertise: "Electrical Engineering")
let recruiter1 = Recruiter(name: "Queen Elizabeth I", company: "Apple")

messagesMediator.add(recipient: programmer0)
messagesMediator.add(recipient: programmer1)
messagesMediator.add(recipient: recruiter1)

spamGenerator.spamSpamSpamSpam(message: "I'd Like to Add you to my LinkedIn Network", worker: messagesMediator)

/* When successfully completed, the last line of the code will print:
 Hedy Lamar received: I'd Like to Add you to my LinkedIn Network for possible iOS Development work
 Michael Faraday received: I'd Like to Add you to my LinkedIn Network for possible Electrical Engineering work
 Queen Elizabeth I received: I'd Like to Add you to my LinkedIn Network. I am a recruiter at Apple
 */
```
<!-- Instructor: Solution to Activity  is below Additional Resources
-->
