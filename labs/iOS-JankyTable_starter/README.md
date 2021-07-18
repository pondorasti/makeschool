# iOS-JankyTable_starter
Starter app for MOB 2.3 L04 assignment

To illustrate a scenario that would benefit from concurrency, we created an app intentionally designed as a really, *really* bad example of poor table view cell configuration and scrolling performance.

Our app:
- fetches image URLs from a plist
- then fetches AND processes each image *before* presentation to the user

To accentuate how badly its UI performs, we made it worse: to simulate a network delay, we added a 1-second sleep interval on the thread so that each cell will pause for 1 second just before it is configured for presentation by the table view.

**TODO:**
1) Download and run the app

2) While running, examine the 2 points in the UI flow in which performance currently is most noticeably horrible:
- on initial table view presentation
- whenever the user scrolls the table view

3) Set a breakpoint somewhere in the `cellForRowAt(_:)` function (at ` return cell` on line 56 is a good place):

- when Xcode stops on your breakpoint, examine the Threads and Queues listed in the Debug Navigator in the Navigation Pane. (i.e., find the button for toggling between "View Process by Thread" and "View Process by Queue" and practice viewing each in turn.)

For next class, be prepared to answer these questions:

**Q:** How many threads are active at the breakpoint?

**Q:** How many queues?

**Q:** What is the thread number of the `main queue`?

**Q:** What is the *last function* executed prior to the breakpoint?

**Q:** What is the *first function* executed on the `main queue`/`main thread`?

**Q:** Why do you think it takes so long to present the images to the user?

**Q:** Why is scrolling so slow?

**Q:** What could you do to resolve these 2 egregious UI issues?

**Evaluation**

Submit a working version of the app, must have all the following:
- Table scrolls without lagging
- Images download and get a filter

Stretch Challenges:
- Add an activity indicator while downloading
- Fix the issue of cells being reused without being cleaned up first
