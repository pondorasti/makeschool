# Ticket Writing ([Slides](https://docs.google.com/presentation/d/1ELpW7E9ccpW3rDtMEEaq57dvix00ca0GB2dxhrleJOY/edit#slide=id.p))

## Learning Objectives

1. Explain the value in breaking up a single feature into multiple tickets
1. Evaluate the contents of a ticket to determine if it has sufficient, actionable information
1. Create a feature ticket with basic components such as user stories, requirements, and business values
1. Create a bug ticket with basic components such as diagnostic information, repro steps, and current/expected behavior
1. Apply the ROAM technique to risks in feature tickets

## Telephone activity

Link to [online telephone game.](https://garticphone.com)

(see slides) Students are asked to draw a picture from a spec - then write a spec from that feature, then draw picture, then spec, etc. The activity demonstrates how much miscommunication happens when you don't have clearly defined tickets and specs

## Bad Ticket Example

Show off what a bad ticket looks like, and why it is detrimental to software development

## Structure of a well-written ticket

A well-written ticket contains the following:

1. User Story: concise one-liner on what we’re building and why
1. Requirements: What are we building?
1. Business Value: Why are we building this?
1. Edge Cases: What are known problems to keep in mind that would only occur under extreme circumstances?
1. Risks: What are any known risks with this feature and how will we address them?

Let's dive into each of those:

### User Story

Should convey why we’re building this feature. What is the user’s journey in using it? Use this format to help with writing it:
As a [user_persona] I want to [interaction_with_feature] so that I can [end_user_goal]

Take a past project and write a user story for a feature

### Requirements

Describes what the feature is and how it should behave.

Take that previous feature and write the requirements for it

### Business Value

A concise, 1-2 sentence statement as to why we’re building this feature, and what value it adds to the company.
A non-technical person (executive, board member, etc.) should be able to read this statement and understand why it’s necessary.

Take that previous feature and write the business value for it

### Edge Cases

Along with requirements, if there are known edge cases, be sure to describe how the feature should behave when it encounters the edge case

Take that previous feature and note down the edge case(s) for it

### Risks

Risks should be noted and ROAMed:

- Resolve: Risk has been answered/avoided/eliminated
- Own: Risk is now owned by someone who’s responsible for handling it
- Accept: Risk is accepted, and nothing will be done about it
- Mitigate: The impact/likelihood of the risk has been decreased through actions by the team

[More info on ROAM](https://content.intland.com/blog/agile/safe/roam-risk-management-under-safe)

ROAM a risk for that same feature for your project, or one you had before that ended up having an unforseen risk. How would you have better prepared for it?

## Writing Bug Tickets

Good bug tickets require the following:

- Summary: 1-2 sentences describing the issue
- Diagnostic Info: Platform, OS Version, Browser Version, SDK version, etc.
- Repro Steps: Sequential steps on how to reproduce the bug
- Current Behavior: What are you currently seeing?
- Expected Behavior: What should you be seeing?

## Peer Review Ticket

1. Share your ticket with another team
1. Have the other team review the ticket, and then give feedback on the quality of the ticket (10 minutes)
1. Apply the feedback to your ticket (10 minutes)

Remember: a new engineer should be able to understand ~90% of the ticket

## Wrap Up 

- Break tickets up into iterative deliverables (MVP → Final Product)
- Provide enough detail that any engineer can read it and understand what’s needed and why we’re building this feature
- Call out risks up front if they’re known, and how you plan to ROAM them
- Bugs need detail as well: how you found the bug, and what the expected behavior should be
