## [Part 2]: Domain Name System, Web Server Architecture, Security, DDoS Attacks

[Part 2]: https://product-college-labs.github.io/Core-How-the-Internet-Works/Part2

---

### Part 1 Recap and Part 2 Preview

In Part 1 we covered the binary nature of communication over computer networks and the Internet and how information is sent in packets that have to and from IP/port addresses in them. We covered the 7 layer ISO networking model and how protocols organize information (bytes of data) into groups providing a standard way for software to encode and decode information.

In Part 2 we'll cover the Domain Name System (DNS), how hackers are thrwarted by routers and firewalls and how web sites handle huge numbers of users.  We'll also cover how large web sites fend off denial of service attacks and regional data center outages using load balancers, routers and DNS to provide fault-tolerance and fail-over. We'll cover several security defenses in user networks and server deployments and we'll cover dynamic web page servers which include a database to generate user specific content.

### The Domain Name System (DNS)

![](images/DomainNames.png)

A domain name is a globally unique human readable set of words joined by dots. The primary word is called the Top Level Domain and is usually .com, .net or .org, but as of 2017, there are hundreds of TLDs. If you want your own domain name for your web site, you can go to a Domain Name Registrar like dreamhost.com which also provides web hosting, or a pure DNS only registrar like gkg.net. Domain names are often two words like google.com, but can be comprised of three or four words or more in certain circumstances.

![](images/DNSProcess.png)

Domain names in the UK are always at least 3 words because the .uk country code is the Top Level Domain. The diagram shows how your ISP's DNS server resolves the domain name www.ofcom.org.uk by requesting information from a number of DNS servers, each of which has IP address information of the domain name, or the IP address of the next DNS server to ask who will have the next level of IP address info or again further forwarding IP addressof another DNS server. This ends when the forwarding IP address resolves to the (in this case) the Ofcom Authoritative Name Server. Also note that once a domain has been resolved, it remains valid for a duration specified by the name server using a Time To Live (TTL) value of minutes to days.

Let's watch this video: [How the Domain Name System (DNS) works](https://www.youtube.com/watch?v=GlZC4Jwf3xQ)

### NAT and SPI thwart hackers

Network Address Translation allows a router to virtualize a large number of local IP addresses behind a single public IP address. Stateful Packet Inspection can detect and eliminate corrupt and hacked packet structures and protocol violations for a large number of application protocols. NAT adds an excellent security protection for local networks against attack from the public network.

![](images/FireWall.png)

### Firewall layers protecting web servers and databases

Firewalls are typically network devices that have two Ethernet ports, one facing the hostile Internet and the other facing your web server or application server. The firewall prevents packets that are undesirable from reaching your servers, yet allows acceptable packets to flow in both directions.

![](images/ServerDefenses.png)

### Load balancer

Load balancers are often hardware network devices that have one Ethernet port facing the Internet, and a dozen or more Ethernet ports facing individual servers. The load balancer uses information from the servers to send new client session requests to different servers spreading the load evenly among them, avoiding overloading any one server.

![](images/LoadBalancer.png)

### Second data center as backup deployment

Commercial web sites that have business critical operation requirements often use two or more data centers in different areas to provide backup and load sharing. If the primary data center experiences a failure, from say an Earthquake, the alternative data center picks up the load and the clients are able to continue using the site, unaware that the primary site is down.

![](images/RedundantDataCenter.png)

### Dynamic web server has both unchanging content and user specific content delivered from a application server and database

Most web sites have static content, such as pictures, format data (CSS) and unchanging web page content that is best served directly from a web server. Some portion of the web sites content is usually client specific based on their login credentials. The user specific content is dynamic and served by a application server in conjunction with a database server.

![](images/DynamicWebContent.png)

### SQL Injection Attack

One of the more common and easily avoidable web site hack attacks is called a SQL injection attack. In this case a clever hacker looks at the web page and figures out that certain fields in a web form do not scrub special characters such as quotes and then feeds a specially constructed string of characters into a field that passes through to the database, causing it to execute a command that the programmers would never want to be possible. In the case below, the hacker is attempting to have the database provide the list of users as a response, revealing confidential information.

![](images/SQLInjection.png)

### Distributed Denial of Service Attack (DDoS)

A DDoS attack is often performed by hackers that are attempting to blackmail or damage a company by knocking their web site offline by overloading it with fake traffic. The hacker uses a botnet that is controlled by a botnet controller computer. Botnets are usually formed by unsuspecting end users computers which have a secret infection of malware that operates without their knowledge, normally leaving their computer unaffected, until it is needed to be part of a DDoS attack.

![](images/DDOS.png)

### Network Hubs, Switches and Routers

A hub forwards packets it receives to all locally connected devices. A switch only forwards packets to the correct locally connected device avoiding sending unnecessary packets improving network performance. A router performs the role of a switch and adds one or more additional isolated networks and move packets between those networks while performing NAT, DHCP, firewall functions and many other functions.

![](images/HubVersusSwitch.png)

Let's watch this video exploring [Hubs, Switches and Routers](https://www.youtube.com/watch?v=Ofjsh_E4HFY)

### How your computer and smart phone get their IP address

Dynamic Host Controll Protocol or DHCP is used by end user smart devices and computers to attach to WiFi and cellular networks. The device requests an IP address using a broadcast packet and waits for a response packet from the DHCP server on the local network.

![](images/DHCP.png)

Let's watch this video on how your laptop or smart phone gets its IP address when it connects to a network with [Dynamic Host Configuration Protocol (DHCP)](https://www.youtube.com/watch?v=RUZohsAxPxQ)

### UDP vs TCP

UDP just sends a packet to a destination. TCP establishes a session which guarantees bidirectional streams of data between two computers are in order, uncorrupted and TCP will close the session if there is an unrecoverable error.

![](images/TCPvsUDP.png)

Let's watch this video on the differences between [UDP and TCP Transport Layer Protocols](https://www.youtube.com/watch?v=Vdc8TCESIg8)

---

## [Part 1]: Networking and Internet Communication, HTTP Request-Response Cycle

[Part 1]: https://product-college-labs.github.io/Core-How-the-Internet-Works/Part1
