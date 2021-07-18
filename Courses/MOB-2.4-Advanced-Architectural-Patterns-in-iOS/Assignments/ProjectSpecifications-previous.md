# Design Patterns App


## Project Outline

</br>

### &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;__*Res Ipsa Loquitur*__  
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; — *A Latin phrase that means: "The thing speaks for itself"* </br></br>

The primary goal for this project is to afford you an opportunity for your knowledge of this course’s topic to speak for itself.

You are to create a a portfolio piece that:
* can be used as a reference for the work you have done in this course, which you might also share with the iOS developer community
* will demonstrate to prospective employers your knowledge of intermediate design patterns relevant to iOS development

Rather than merely answering interview questions about your knowledge of iOS design patterns, you will have an app that speaks for you.

## Data Model

As long as you follow the guidelines outlined below, the content of each pattern's subordinate scene is up to you.

Thus you may use your own discretion in choosing a data model/data source for each scene.

Robust data persistence is not required; any simple persistence mechanism (i.e, plist, file system) should suffice, as most of the data will be strings, and the focus of this work is mostly on simple architecture with no user-selected data.

## Feature Outline

Create a table view app which showcases the design patterns covered in Lessons 1 through 6 of this course.

The name of your app is up to you. But it is recommended that you choose a name that states the app’s purpose. Here are some examples:
* MOBDesignPatterns
* Design Patterns
* iOS Design Pattern - *(though this name implies a stronger commitment to showcase iOS-specific illustrations for each pattern)*


Your app is to have the following **characteristics:**

1. Each section in the table view will represent each of the major types of design patterns. i.e., you will create a separate table view section for each of the following:
* `"Creational"`
* `"Behavioral"`
* `"Structural"`

2. Within each table view `section`, each pattern covered in class is to have its own `cell`

**Cell Construction Notes:**
* It is *not required* that cells need to be reusable `Prototype` cells. Whether you use `Static` or reusable `Prototype` table cells is up to you.
* However, it *is required* that cells must provide:

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  - a subtitle</br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  - a way to invoke a detail scene (i.e, either by creating a Detail cell, or providing a button, which will invoke the detail VC)

* For cell subtitles - You are required use the subtitle of the cell as a means to add more information describing each pattern. However, you do *not* need to use the descriptors (`Complexity` and `Popularity`) illustrated in the examples provided; you *may* use those descriptors if you do not arrive at a descriptive subtitle on your own. But you are also free to create a subtitle of your own choosing, provided your custom subtitle adds descriptive value to each cell's design pattern.

3. Tapping any of the cells within a section will launch a subordinate scene presenting a VC of the same name as the cell tapped:
&nbsp;&nbsp;&nbsp; - each pattern's cell will have 2 sub-scenes:

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;(a) a description of the pattern

&nbsp;&nbsp;&nbsp;(b) an implementation example

* subordinate scenes can be arranged as either:

&nbsp;&nbsp;&nbsp; - in series — i.e., master/detail

&nbsp;&nbsp;&nbsp; - in parallel — i.e., using a Segmented Control

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;*(see diagrams below for illustrations)*

**notes on cell implementation examples:**
* Whenever possible, try to create a “live” functional "animation" of the pattern (see XXX in the diagram below)
* It is understood that it is extremely difficult to provide live functional examples for some patterns due to their essential nature. For those patterns, you may fall back on using the following to illustrate your knowledge of them:

&nbsp;&nbsp;&nbsp; - example code snippets and/or diagrams


__*Suggestions*__
- To pace yourself, start by completing the shell of the app first, then work from the top (i.e., Creational) of the list of main types, filling in each of the patterns in Creational that were taught in class before moving on to Behavioral, etc.
- When done implementing scenes formal all patterns taught in class, you may want to expand each table view section by adding patterns not taught in class to their respective group/table view section (if time permits).
- Before proceeding, become familiar with the free example apps listed below.


__*Other Notes*__
1. For the Observer Pattern - You may use your choice of either KVO, Notification, or a non-iOS Observer implementation to illustrate it.

<!-- Add note about animation here -- a symbolic representation of teh pattern itself. for example,
-->


### Minimally Viable Product (MVP)

To achieve **MVP** status:

- You should create a completed scene for *at least* two (2) of the design patterns taught in class for each of the three main design categories

&nbsp;&nbsp;&nbsp; - i.e., at least 2 of the 4 from Creational, 2 from Behavioral, and so on.

- Each pattern's scene should have a general description (text) view and an implementation view that illustrates the pattern by, at minimum, providing a code snippet and/or a diagram depicting one use case specific to the given pattern.

### Stretch Challenges

1. Demonstrate live, functional examples of at least 2 of the design patterns covered in class.
2. Include, in its respective table view section, at least one additional pattern from each of the three main design pattern categories, that was not covered in any of the formal lessons in this course.
3. Add illustrative graphic images/icons next to each pattern.

### To Jog Your Creativity

You will of course want to create an original app that uniquely showcases and exemplifies your knowledge and experience of the subject.

However, in the event you get stuck and need to jog your creativity at any point, check out these **example apps** for clues:

- [Design Patterns by Example: Examples on Obj-C and Swift - by Geomatix Laboratory s.r.o.](https://itunes.apple.com/us/app/design-patterns-by-example/id1271220838?mt=8)
- [Design Patterns (OOAD & Service Oriented Architecture) - by SQUBE LLC](https://itunes.apple.com/us/app-bundle/design-patterns-ooad-service-oriented-architecture/id994675488?mt=8)
- [Algorithms & Data Structures: Examples and implementations - by Alexander Murphy](https://itunes.apple.com/us/app/algorithms-data-structures/id1431032601?mt=8)


## Screen Layout
<!--
Here are mockups of the individual screens the app should contain, including their connections to each other:

![image](TripPlanner_ScreenFlow.png)

Feel free to design nicer screens than shown in these mockups! They are primarily concerned with the functionality of each screen, not with the specific design or layout.

-->

### Screen Details

<!--
This section provides details for some of the more complex screens.
-->

#### Main Screen

The main scene is a list of design patterns organized by main pattern type (Creational, etc.):
</br>

![example](assets/MainScene.png)


## Project evaluation criteria

[Link to: 2.4 MOB Project Rubric](https://docs.google.com/document/d/1qKSs3S4QlhD_6QpkSsQKtzIdp2lCouEmoRVxvJDvhI0/edit)

<!-- TODO:
  - Rubric needs modified to fit:
https://docs.google.com/document/d/1qKSs3S4QlhD_6QpkSsQKtzIdp2lCouEmoRVxvJDvhI0/edit
  -->
