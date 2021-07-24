# ⛓ Intro to Protocols

<!-- > -->

<!-- omit in toc -->
## ⏱ Agenda {docsify-ignore}

- [[**05m**] 🏆 Objectives](#05m-%f0%9f%8f%86-objectives)
- [[**20m**] 👋 Welcome to Class](#20m-%f0%9f%91%8b-welcome-to-class)
- [[**30m**] 📖 Overview: Network Protocols](#30m-%f0%9f%93%96-overview-network-protocols)
- [[**10m**] 🌴 BREAK](#10m-%f0%9f%8c%b4-break-docsify-ignore)
- [[**05m**] 💻 Prep: Simulator Activities on Code.org](#05m-%f0%9f%92%bb-prep-simulator-activities-on-codeorg)
- [[**30m**] 💻 Internet Simulator: Broadcast](#30m-%f0%9f%92%bb-internet-simulator-broadcast)
- [[**35m**] 💻 Internet Simulator: Routers](#35m-%f0%9f%92%bb-internet-simulator-routers)
- [[**35m**] 💻 Internet Simulator: Packets](#35m-%f0%9f%92%bb-internet-simulator-packets)
- [📚 Resources & Credits](#%f0%9f%93%9a-resources--credits)

<!-- > -->

## [**05m**] 🏆 Objectives

1. Present an overview of the course and syllabus.
1. Define the term `protocol` and describe when and where they are used.
1. List common protocols used by developers.
1. Create a diagram of data flowing through a protocol.

<!-- > -->

## [**20m**] 👋 Welcome to Class

Instructor will walk through the [syllabus](https://make.sc/bew2.4) and answer questions about the course.

Students, remember to join the course Slack channel, `#bew2-4-dapps`!

<!-- > -->

## [**30m**] 📖 Overview: Network Protocols

<!-- > -->

> **Protocol**: Standard set of rules that allow devices to communicate with one other.

 Protocols are a fundamental aspect of digital communication, and are the **digital equivalent to spoken language**! If two people share the same language, they can communicate effectively; similarly, **if two hardware devices support the same protocol, they can communicate with each other --- regardless of the manufacturer or type of device**.

The rules of each protocol must describe...

- What **type of data** can be transmitted.
- What **commands are used** to send and receive the data.
- How **transfers** of the data are **verified**.

📲**IMPORTANT**: _In Objective-C and Swift, a `protocol` is a syntactic structure that defines a blueprint of methods, properties, and other requirements that suit a particular task or piece of functionality. The above definition is most common._

<!-- > -->

### Real Life Examples

| Task | Protocol |
| :--- | :------: |
| Sending an email | [SMTP](https://techterms.com/definition/smtp) |
| Visiting a website | [HTTP](https://techterms.com/definition/http) |

<!-- > -->

<!-- > -->

### Four Categories

![Network Layers](Assets/Layers.png)

<!-- > -->

#### :one: Link Layer&nbsp;&nbsp;&nbsp;&nbsp;[PPP](https://techterms.com/definition/ppp), [DSL](https://techterms.com/definition/dsl), [Wi-Fi](https://techterms.com/definition/wi-fi)

Establish communication between devices at a hardware level.

The hardware on each device must support the same link layer protocol to transmit data to one another.

<!-- > -->

#### :two: Internet Layer&nbsp;&nbsp;&nbsp;&nbsp;[IPv4](https://techterms.com/definition/ipv4), [IPv6](https://techterms.com/definition/ipv6)

Initiate data transfers and route them over the internet.

<!-- > -->

#### :three: Transport Layer&nbsp;&nbsp;&nbsp;&nbsp;[TCP](https://techterms.com/definition/tcp), [UDP](https://techterms.com/definition/udp)

Define how [packets](https://techterms.com/definition/packet) are sent, received, and confirmed.

<!-- > -->

#### :four: Application Layer&nbsp;&nbsp;&nbsp;&nbsp;[HTTP](https://techterms.com/definition/http), [IMAP](https://techterms.com/definition/imap), [FTP](https://techterms.com/definition/ftp)

Contain commands for specific applications.

- **Example 1**: _Browser uses [HTTPS](https://techterms.com/definition/https) to securely download the contents of a webpage from a web server._
- **Example 2**: _Email client uses [SMTP](https://techterms.com/definition/smtp) to send email messages through a mail server._

<!-- > -->

## [**10m**] 🌴 BREAK {docsify-ignore}

<!-- > -->

## [**05m**] 💻 Prep: Simulator Activities on Code.org

1. **Students**: Join [Code.org Section](https://studio.code.org/join/RZFRVG).
1. **Make sure you complete the activities!** What you learn through your experiments with the Internet Simulator will be utilized throughout this course. Make sure you complete the reflection questions when asked.
1. This activity earns you participation credit in the course. The instructor will check your progress on the Code.org dashboard and randomly visit your breakout rooms to verify your participation.
1. Questions from each module's check for understanding may appear on [Quiz 1: Protocols](../Resources/StudyGuide.md).

<!-- > -->

## [**30m**] 💻 Internet Simulator: Broadcast

In groups of 5 to 6, complete the [**The Need for Addressing**](https://studio.code.org/s/csp1-2018/stage/9/puzzle/1) module.

When you reach the activity, use this [**Activity Guide**](https://docs.google.com/document/d/1r1r1JScAThVhJog9VJ-gbQx0zyxT3dXFLMEkp6m5Awg/edit) to get started.

Make sure you also grab a copy of the [**Game Board**](https://docs.google.com/document/d/1oKi5_35xB-6Np5stnbGq7MCKnRZVC5qCVUQmAJByrTI/edit)! You'll need it to complete the exercise.

<!-- > -->

## [**35m**] 💻 Internet Simulator: Routers

 In groups of 3 to 4, complete the [**Routers and Redundancy**](https://studio.code.org/s/csp1-2018/stage/10/puzzle/1) module.

When you reach the activity, use this [**Activity Guide**](https://docs.google.com/document/d/1XD3spnHFOzq8br2p-Wrm8S2aZ9WcGUfzMwWURgzIk24/edit) to get started.

<!-- > -->

## [**35m**] 💻 Internet Simulator: Packets

In groups of 2 to 4, complete the **[Packets and Making a Reliable Internet](https://studio.code.org/s/csp1-2018/stage/11/puzzle/1)** module.

When you reach the activity, use this [**Activity Guide**](https://docs.google.com/document/d/13v27WVdqY23nqG9Rp-U4ypp_vsFAPaKhz37_KbbCbGI/) to get started.

<!-- > -->

## 📚 Resources & Credits

- [**TechTerms**: Protocol Definition](https://techterms.com/definition/protocol)
- [**Lesson Plan**: The Internet Is for Everyone](https://curriculum.code.org/csp-18/unit1/8/)
- [**Lesson Plan**: The Need for Addressing](https://curriculum.code.org/csp-18/unit1/9/)
- [**Lesson Plan**: Routers and Redundancy](https://curriculum.code.org/csp-18/unit1/10/)
- [**Lesson Plan**: Packets and Making a Reliable Internet](https://curriculum.code.org/csp-18/unit1/11/)
