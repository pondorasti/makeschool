<!-- Run as a slideshow: reveal-md README.md -w -->
# 🐳 Alerts & Notifications

⭐️ **GOAL**: Integrate [FreshPing] notifications for uptime monitoring. Utilize new integration by creating a status page for your PaaS.

<!-- omit in toc -->
## ⏰ Agenda (120m)

- [[**10m**] **Warm Up**: Disaster Scenarios](#10m-warm-up-disaster-scenarios)
- [[**10m**] **Discuss**: Disaster Scenarios](#10m-discuss-disaster-scenarios)
- [[**10m**] **TT**: Avoiding Disaster](#10m-tt-avoiding-disaster)
  - [Command Line Tools](#command-line-tools)
- [[**10m**] **TT**: Automating Uptime Monitoring](#10m-tt-automating-uptime-monitoring)
- [[**10m**] **Activity**: Set Up an Uptime Monitor](#10m-activity-set-up-an-uptime-monitor)
- [[**10m**] **TT**: Status Pages](#10m-tt-status-pages)
- [[**05m**] **Demo**: BEW 2.2 Dashboard](#05m-demo-bew-22-dashboard)
- [[**10m**] **Activity**: Set Up a Status Page](#10m-activity-set-up-a-status-page)
- [[**15m**] **Break**](#15m-break)
- [[**10m**] **TT**: Resource Monitoring](#10m-tt-resource-monitoring)
  - [Introducing Netdata](#introducing-netdata)
  - [Industry Use](#industry-use)
  - [What Netdata Monitors](#what-netdata-monitors)
- [[**10m**] **Activity**: Working With Netdata](#10m-activity-working-with-netdata)
  - [Step 1: Enable Netdata](#step-1-enable-netdata)
  - [Step 2: Enable Alerts](#step-2-enable-alerts)
  - [Step 3: Discover the Dashboard](#step-3-discover-the-dashboard)
- [[**10m**] **Wrap Up**: Poll / Q+A](#10m-wrap-up-poll--qa)

<!-- > -->

<!-- omit in toc -->
<!-- ## 🏆 Objectives -->

<!-- TODO: Objectives -->

<!-- *By the end of this class, you'll be able to&hellip;* -->

<!-- |   Level   | Verbs |
| --------- | ----- |
| **6: Create** | _design, formulate, build, invent, create, compose, generate, derive, modify, develop_ |
| **5: Evaluate** | *choose, support, relate, determine, defend, compare, contrast, justify, support, convince, select* |
| **4: Analyze** | *classify, break down, categorize, analyze, diagram, illustrate, criticize, simplify, associate* |
| **3: Apply** | *calculate, predict, apply, solve, illustrate, use, demonstrate, determine, model, perform, present* |
| **2: Understand** | *describe, explain, paraphrase, restate, summarize, contrast, interpret, discuss* |
| **1: Remember** | *list, recite, outline, define, name, match, quote, recall, identify, label, recognize* | -->

<!-- > -->

## [**10m**] **Warm Up**: Disaster Scenarios

In breakout groups of 4, discuss and record **every way** something could go wrong with a deployed application.

Example scenario: _The server lost power due to a severe thunderstorm._

<!-- > -->

## [**10m**] **Discuss**: Disaster Scenarios

Call on students and ask them to contribute what they discussed to a running list of disaster scenarios.

We'll be talking about how to mitigate many of these risks today!

<!-- > -->


## [**10m**] **TT**: Avoiding Disaster

Today, we'll cover several ways to know and be notified when you're site goes down.

First, let's learn how we can check manually using our terminal.

### Command Line Tools

<!-- > -->

#### Ping

Test the `ping` command using your server's IP address or hostname.

```sh
ping 111.111.111.111
```

```sh
ping captain.dev.YOURDOMAIN.COM
```

<!-- > -->

## [**10m**] **TT**: Automating Uptime Monitoring

These manual techniques work great when you're sitting in front of your computer. But what if you're AFK? How will we know the server is down?

<!-- > -->

## [**10m**] **Activity**: Set Up an Uptime Monitor

1. Go to [FreshPing] and use the form on the left to create a new account:
   1. Enter `https://captain.dev.YOURDOMAIN.COM` in the first field.
   1. Enter your email address in the second field.
1. Click the activation link sent to your email. _Required to receive alerts reliably._
1. **FreshPing adds your first server automatically. You're all done!**

Use the remaining time to explore FreshPing's interface.

<!-- > -->

## [**10m**] **TT**: Status Pages

**Status pages**:

- Communicate incidents, scheduled maintenances and downtimes.
- Can either be public or private.
  - Private status pages communicate incidents with internal teams only
- Helps you build customer trust.
- Showcase the reliability of your platform
  - Historical uptime
  - Performance timeline of your service
- Control over how you communicate an incident
- Notify customers in real-time with updates to incidents and scheduled maintenance
- Reduce the number of phone calls or tickets when the site goes down.
- Should be hosted on a server other than the one(s) you're monitoring.
- Help you learn more about how fast you respond to downtime.
- Should always be hosted on a different server and network than the servers you're monitoring.

<!-- > -->

## [**05m**] **Demo**: BEW 2.2 Dashboard

Demonstrate a status page that monitors all servers for the course: [make.sc/bew2.2-dashboard].

<!-- > -->

## [**10m**] **Activity**: Set Up a Status Page

1. Add a status page on [FreshPing].
1. Add `captain.dev.YOURDOMAIN.com` to the status page.
1. Paste the URL for your status page in chat.

We will be adding additional alerting and status indicators when we discuss [Docker Swarms].

<!-- > -->

## [**15m**] **Break**

<!-- > -->

## [**10m**] **TT**: Resource Monitoring

### Introducing Netdata

**Netdata is**:

1. A metrics collector for system and application metrics (including web servers, databases, containers, and much more)
1. A long-term metrics database that stores recent metrics in memory and "spills" historical metrics to disk for efficient long-term storage
1. A super fast, interactive, and modern metrics visualizer optimized for anomaly detection
1. An alarms notification engine for detecting performance and availability issues

See **[Why Netdata]** for more.

### Industry Use

<img src="https://user-images.githubusercontent.com/2662304/48305662-9de82980-e537-11e8-9f5b-aa1a60fbb82f.png">

Used by Amazon, DigitalOcean, Google, Groupon, Microsoft, NewRelic, Nvidia, TicketMaster, Vimeo, and more!

See [Netdata User Base] for the full list.

### What Netdata Monitors

- CPU
- Memory
- Disks
- Filesystems
- Networking
- Containers
- Log files

See the full list of [supported collectors].

Netdata's data collection is **extensible**, which means you can monitor anything you can get a metric for. You can even write a collector for your custom application!

<!-- > -->

## [**10m**] **Activity**: Working With Netdata

![](https://user-images.githubusercontent.com/1153921/80827388-b9fee100-8b98-11ea-8f60-0d7824667cd3.gif)

<!-- > -->

### Step 1: Enable Netdata

1. Log in to CapRover.
1. Choose **Monitoring** from the sidebar.
1. Click the `Start Netdata Engine` button on the middle of the page.

### Step 2: Enable Alerts

Send email alerts to your gmail account by scrolling down to Notification Settings and entering the following data in the **Email (SMTP)** section:

- **Recipient Email**: `youraccount@gmail.com`
- **Server Tag**: `CapRover`
- **SMTP Server**: `smtp.gmail.com`
- **SMTP Port**: `587`
- **Unsecure**: Leave unchecked
- **SMTP Username**: `youraccount@gmail.com`
- **SMTP Password**: `your_gmail_password` (will be hidden after submitting)

Click `Update Netdata` to finish.

<!-- > -->

### Step 3: Discover the Dashboard

Browse the dashboard by clicking `Open Netdata`!

<!-- > -->

## [**10m**] **Wrap Up**: Poll / Q+A

Present students with a Zoom poll to determine their progress for the day.

Use the remaining time to answer questions before dismissing class.


<!-- omit in toc -->
## 📚 Resources & Credits

- [Netdata] on GitHub
- [Why should you use status page?](https://www.freshworks.com/statuspage/why-status-page/)

<!-- do not edit below this line !-->
[Gradescope]: https://www.gradescope.com/courses/133579
[StatusPage.io]: https://statuspage.io
[Docker Swarms]: Swarm.md
[FreshPing]: https://www.freshworks.com/website-monitoring/
[make.sc/bew2.2-dashboard]: https://make.sc/bew2.2-dashboard
[Resource Monitoring]: https://caprover.com/docs/resource-monitoring.html
[Netdata]: https://github.com/netdata/netdata
[Netdata User Base]: https://github.com/netdata/netdata#user-base
[Why Netdata]: https://github.com/netdata/netdata#why-netdata
[Supported Collectors]: https://github.com/netdata/netdata/blob/master/collectors/COLLECTORS.md
