# 📜 Day 10: Large Attacks, Real Defenses

### ⏱ Agenda

1. [🏆 [**5m**] Learning Objectives](#%f0%9f%8f%86-5m-learning-objectives)
2. [💻 [**20m**] Reading: Dissecting a DDoS](#%f0%9f%92%bb-20m-reading-dissecting-a-ddos)
3. [📖 [**20m**] Overview: DDoS & Features](#%f0%9f%93%96-10m-overview-ddos--features)
6. [🌴 [**10m**] BREAK](#%f0%9f%8c%b4-10m-break)
7. [💻 [**60m**] Lab Time](#%f0%9f%92%bb-60m-lab-time)
8. [🌃 After Class](#%f0%9f%8c%83-after-class)
9. [📚 Resources & Credits](#%f0%9f%93%9a-resources--credits)

## 🏆 [**5m**] Learning Objectives

1. Gain insight into real world large scale attacks and how to defend against them.

## 💻 [**20m**] Reading: Dissecting a DDoS

1. Read this article: [How To Accidentally Stop a Global Cyber Attack](https://www.malwaretech.com/2017/05/how-to-accidentally-stop-a-global-cyber-attacks.html).
2. **Challenge**: Reverse engineer Marcus Hutchins' solution that prevented the spread of the attack. How did he figure it out?
3. **Stretch Challenge**: Why did it work? Explain in detail.

## 📖 [**10m**] Overview: DDoS & Features

The work of a Distributed Denial of Service attack is typically done by a [botnet](https://en.wikipedia.org/wiki/Botnet).

**Computers can be co-opted into a botnet when they execute malicious software**.

This can be accomplished by luring users into making a drive-by download, exploiting web browser vulnerabilities, or by tricking the user into running a Trojan horse program, which may come from an email attachment.

Botnets typically **install modules** that allow the computer to be **commanded and controlled** by the botnet's operator.

After the software is downloaded, it will **call home** to the host computer. When the re-connection is made, a bot may then delete itself or remain present to update and maintain the modules at the operator's behest.

### Features of a Botnet

- **Submit as many requests as possible** to a single computer or service, overloading it and preventing it from servicing legitimate requests.
  - **Example**: A victim's server is bombarded with requests by the bots attempting to connect to the server, therefore, overloading it.
- **Install spyware** to gain access to sensitive information. See the Aurora botnet for more details.
- E-mail spam and phishing abilities **disguised as messages from people**.
  - Can be advertising, annoying, or malicious.
- **Click fraud**: when a user's computer visits websites without their awareness to create false web traffic.
  - For personal or commercial gain.
- **Bitcoin mining** in order to generate profits for the operator of the botnet.
- **Self-spreading functionality** to aim for more infection, is also spotted in several botnets. Some of the botnets are utilizing this function to automate their infections.

## 📖 [**10m**] Overview: Creating / Using a Botnet

This example illustrates **how a botnet is created and used for malicious gain**:

1. A hacker purchases or builds a Trojan and/or exploit kit and uses it to start infecting users' computers, whose payload is a malicious application—the bot.
2. The bot instructs the infected PC to connect to a particular command-and-control (C&C) server.
   1. This allows the botmaster to keep logs of how many bots are active and online.
3. The botmaster may then use the bots to gather keystrokes or use form grabbing to steal online credentials and may rent out the botnet as DDoS and/or spam as a service or sell the credentials online for a profit.
4. Depending on the quality and capability of the bots, the value is increased or decreased.

### Advanced Botnets

Newer, more advanced botnets will **scan the environment** and gain access to additional resources through a periodic system scan.

The most valuable botnets scan for the highest number most relevant system exploits and report back to the owner each and every vulnerability that exists in the system at the time of scanning.

## 🌴 [**10m**] BREAK

## 💻 [**60m**] Lab Time: Secret Message Assignment / Stretch Challenge

### Lab Time: Secret Messages

Use the remainder of the class to work on your Secret Message assignment. It is due tonight @ 11:59pm on Gradescope!

If you're done with the assignment, consider the below stretch challenge:

### Stretch Challenge (Optional)

Use the [BYOB Framework](https://github.com/malwaredllc/byob) to build your own botnet in Python.

### Features

- **[Client](https://github.com/malwaredllc/byob#client)**
- **[Server](https://github.com/malwaredllc/byob#server)**
- **[Core](https://github.com/malwaredllc/byob#core)**
- [Modules](https://github.com/malwaredllc/byob#modules):
  - **Keylogger**
  - **Screenshot**
  - **Packet Sniffer**
  - **Persistence**
  - **Phone**
  - **Escalate Privileges**
  - **Port Scanner**
  - **Process Control**
  - **iCloud**
  - **Spreader**
  - **Miner**

## 📚 Resources & Credits

- [**Wikipedia: Botnets**](https://en.wikipedia.org/wiki/Botnet)
