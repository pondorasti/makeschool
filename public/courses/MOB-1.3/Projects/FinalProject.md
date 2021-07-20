# Final project - simulating a Take Home Project

## Introduction

Some companies send take home projects to candidates. This is common for small to medium companies and startups.

Take home projects are an opportunity for candidates to demonstrate skills when it comes to making decisions based on instructions or features that need to be build, while also demonstrating coding ability: how they decide to structure code, wether they used external libraries, preferred method of building UI, etc.

## Description

The app you'll be making is a news app. It will fetch articles from recent news and display them as clickable items that will take you to the full story.

![takehome1](assets/takehome1.png)

## Requirements
1. Follow the structure shown in the wireframe. You can customize it to your liking but the main components should remain the same.
1. The first screen of the app shows available categories to choose what kind of news the user wants to browse. You should use a collection view for this. Note that there is a fixed number of categories, you can find them in the docs.
1. Once the user selects a category, you show them a list of the top news. These results will each be a clickable item. You should use a table view with a custom cell.
1. When a news item is selected, you'll open the full story from the original source (open the link to the full story in a web view).
1. The user can go back to the categories screen to keep exploring.
1. You'll need to use the News API https://newsapi.org and get an Api key to make authenticated requests.
1. You can use third party libraries
1. Code must be on Github

## Stretch challenge

Add a search bar in the main screen. Instead of choosing a category, users can directly search news using a keyword. And you'll present results that contain the searched word.

## Rubric

You must score at least 70 points to pass the assignment. Breakdown of points below:

1. **(20 points):** Code quality: MVC structure, separation of concerns, naming conventions, styling.
1. Categories screen
  1. **(5 points):** Displaying the right categories
  1. **(5 points):** Using a collection view.
1. Top news screen
  1. **(5 points):** Displaying the top news for the selected category
  1. **(5 points):** Using a table view.
  1. **(5 points):** Using a custom cell that follow the wireframe design.
1. **(5 points):** Displaying content of news in a web view.
1. **(10 points):** App navigation working
1. **(20 points):** Use the News API via a modular networking layer built by you
1. **(5 points):** Handle JSON using Codable Protocol
1. **(5 points):** Use authenticated requests
1. **(10 points):** Code on Github with a detailed README by the due date.


## Due date

May 13th, 2020

## Resources
Additional resources that will help with this project, or that can be used as reference.

1. https://newsapi.org/docs

<!--
# Final project for MOB 1.3

### Important Dates
Date Assigned: February 7<br>
Github repository due date: March 7 (Github repository)<br>
Testflight due date: March 8

### Description and Requirements

For this term you will complete an individual project that solves a problem using an iOS app. The domain is up to you and the main purpose of this assignment is to have a new entry in your personal portfolio. That means the app **MUST** be available in the App Store by the end of March this year.

All students will give a small presentation on March 7 on their project (5 min max per student). And will have an individual grading session (final code review) to be scheduled later in the term.

Your solution should incorporate the following tools learned throughout the term:
- Closures
- Making requests
- Handling JSON
- Communication patterns

**Basic requirements:**

- The app should make network requests to an existing API (public or built by you).
- The app should handle communication including at least 2 different communication patterns (Delegation, Notifications, etc.).
- The app should be fully functional and must include at least 3 different screens.
- The app should demonstrate care on UI/UX. (Get user feedback early!) This includes correct messaging and ease of use.
- The code should be well documented and show efforts of adhering to good conventions.
- When asked about decisions made in the code, you should be able to justify your choices. (Why choosing a pattern over the over, memory management decisions, on the architecture used).

### Rubric

A full list of expectations for the project can be found in [this rubric](https://docs.google.com/document/d/1skBVPeFrflcgts-qzx84Ym2dDHRJPbtS1SoqoZeamY0/edit?usp=sharing)

To pass the project you need to score **at least 22 points** out of the 32 possible.
-->
