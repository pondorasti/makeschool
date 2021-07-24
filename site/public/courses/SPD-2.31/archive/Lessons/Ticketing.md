# Ticket Writing [(Slides)](https://docs.google.com/presentation/d/1ELpW7E9ccpW3rDtMEEaq57dvix00ca0GB2dxhrleJOY/edit?usp=sharing)

## Minute-by-Minute

| **Elapsed** | **Time**  | **Activity**                        |
| ----------- | --------- | -------------------------           |
| 0:00        | 0:01      | Overview/Learning Objectives        |
| 0:01        | 0:20      | Initial Exercise                    |
| 0:26        | 0:05      | In Class Activity I                 |
| 0:31        | 0:30      | TT 1 + In Class Activity II         |
| 0:56        | 0:10      | TT 2                                |
| 1:06        | 0:20      | In Class Activity III               |
| 1:26        | 0:04      | Summary                             |
| TOTAL       | 1:30      |                                     |

## Why you should know this

This is something every software engineer has to deal with in terms of how they get tasks, or write ones for others. Knowing how to describe a feature or bug in enough detail for another engineer to read with minimal external resources is an important communication skill, and will be important as an engineer grows in their career.

If you aren't able to clearly communicate a feature or bug, in the best case you have to have a number of followup conversations with your team to address unknowns and uncertanties. In the worst case, whoever is working on the ticket will implement it incorrectly, and now it has to be redone, which wastes time, resources, and causes a heavy dose of eye-rolling.

## Learning Objectives (1 min)
By the end of this lesson, students should be able to...

1. Explain the value in breaking up a single feature into multiple tickets
1. Evaluate the contents of a ticket to determine if it has sufficient, actionable information
1. Create a feature ticket with basic components such as user stories, requirements, and business values
1. Create a bug ticket with basic components such as diagnostic information, repro steps, and current/expected behavior
1. Apply the ROAM technique to risks in feature tickets

## Initial Exercise (20 min)

### Telephone Activity (15 min)

**Print out the [drawings](https://drive.google.com/open?id=1X8IAuMv84e6-NTYbSzxL67NGFbo-y2KX) before class**

1. Get into groups of 4 and order yourself by birthday (oldest is first, youngest is last)
1. The **first person** will receive a picture. They need to write steps (requirements) on how to draw the picture. **Only the first person can see this picture.**
1. The **second person** will read those requirements and draw a picture according to those requirements
1. The **third person** will take this newly drawn picture and write steps (requirements) on how to draw the picture. **Only the third person can see the second person’s drawing.**
1. The **fourth person** will read those requirements and draw a picture according to those requirements
1. Present the final drawing and see how it compares to the initial one

### Takeaways (5 min)

- See how details can get lost in translation
- If there's more detail, less room for error
- Building features in software is similar: better to start with something simple (MVP) and then iteratively build up to the final deliverable.

## In Class Activity I (5 min)

- **3 min** - Give an example of a bad feature ticket and ask them to think about how they would implement it. Is it clear enough?
- **2 min** - Go over why this is bad and lead into how to avoid it


## TT I + In Class Activity II (30 min)

### How to Write a Feature Ticket (Five 6 minute segments)

- For each of the sections below, there will be a **1 min TT** on explaining what they are, and then the students will take **5 min** to implement each section on a ticket from their project:
    - **User Stories** should always be written in the following format:
        - As a [user_persona] I want to [interaction_with_feature] so that I can [end_user_goal]
    - **Requirements** describe what the feature is and how it should behave.
    - A **Business Value** is a concise 2-4 sentence statement as to why we’re building this feature, and what value it adds to the company.
        - A non-technical person (executive, board member, etc.) should be able to read this statement and understand why it’s necessary.
    - **Edge Cases** are noted with the expected behavior when they're encountered. It's difficult to think of every edge case initially, but note down the ones that immediately come to mind
    - **ROAMing Risks**: addressing risks on a ticket
        - Resolve: Risk has been answered/avoided/eliminated
        - Own: Risk is now owned by someone who’s responsible for handling it
        - Accept: Risk is accepted, and nothing will be done about it
        - Mitigate: The impact/likelihood of the risk has been decreased through actions by the team


## TT II (10 min)

### Breaking a Ticket Up

- A ticket shouldn’t feel like a novel
- If it feels bloated, it probably needs to be separated into multiple tickets
- Remember to try to break a feature down to it’s MVP and then iterate from there

### Bug Tickets

Bugs need to be clearly written too, otherwise how will engineers know how to fix them?

They should contain at least the following components:

- Summary: 1-2 sentences describing the issue
- Diagnostic Info: Platform, OS Version, Browser Version, SDK version, etc.
- Repro Steps: Sequential steps on how to reproduce the bug
- Current Behavior: What are you currently seeing?
- Expected Behavior: What should you be seeing?

## In Class Activity III  (20 min)

### Peer Review (10 min)

Share your ticket with another team, and have the other team review the ticket, and then give feedback on the quality of the ticket

### Apply the feedback (10 min)

Apply the feedback to improve your ticket

## Wrap Up (4 min)

- Break tickets up into iterative deliverables (MVP → Final Product)
- Provide enough detail that any engineer can read it and understand what’s needed and why we’re building this feature
- Call out risks up front if they’re known, and how you plan to ROAM them
- Bugs need detail as well: how you found the bug, and what the expected behavior should be
