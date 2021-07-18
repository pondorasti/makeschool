# Pair Programming 

> Pair programming is an agile software development technique in 
> which two programmers work together at one workstation. The 
> driver, writes code while the other, the observer or navigator, 
> reviews each line of code as it is typed in. _The two programmers 
> switch roles frequently._

## What is it?

It's a style of programming work that focuses on working in 
pairs. 

## What are the benefits?

### Economics

Pair programming increases the man-hours required to deliver code 
compared to programmers working individually. Experiments yielded 
diverse results, suggesting increases of between 15% and 100%. However, 
the resulting code has about 15% fewer defects. 

_Pair programming signifcantly increases code quality._

#### Design Quality

A system with two programmers possesses greater potential for the 
generation of more diverse solutions to problems for three reasons:

1. the programmers bring different prior experiences to the task;
2. they may access information relevant to the task in different ways;
3. they stand in different relationships to the problem by virtue of their functional roles.

In an attempt to share goals and plans, the **programmers must overtly 
negotiate a shared course of action** when a conflict arises between them. 
In doing so, they consider a larger number of ways of solving the problem 
than a single programmer alone might do.

#### Satisfaction 

In an online survey of pair programmers, 96% of them stated that they 
enjoyed their work more than when they programmed **alone** and 95% said 
that they were **more confident in their solutions** when they pair programmed.

You may not enjoy pairing but, you will feel more confident and find better 
solutions. 

#### Learning 

Knowledge is constantly shared between pair programmers, whether in the 
industry or in a classroom, many sources suggest that **students show 
higher confidence when programming in pairs.**

### Problems with pairing

There are indicators that a pair is not performing well:

1. Disengagement may present as one of the members physically withdraws 
away from the keyboard, accesses email, or even falls asleep.
2. The "Watch the Master" phenomenon can arise if one member is more 
experienced than the other. In this situation, _the junior member may 
take the observer role, deferring to the senior member of the pair for 
the majority of coding activity._ This can easily lead to disengagement.
3. **Silence immediately indicates a lack of collaboration.**

## How does it work? 

While reviewing, the observer also considers the "strategic" direction 
of the work, coming up with ideas for improvements and likely future 
problems to address. This frees the driver to focus all of their 
attention on the "tactical" aspects of completing the current task, 
using the observer as a safety net and guide.

**Important**

1. **Both Participant must be engaged** and paying attention. 
2. **There is a only one computer** which is shared. 
3. **Only the driver is at the keyboard.** 
4. Pairs are **changing roles often.** 

You should be changing roles often and passing the keyboard between you. 

## Exercises 

Run as a mini hackathon. 

Only half students will supply computers. 

Students attempt to solve the dice rolling challenge. 

Working in three 15 min sprints. 

After each sprint students change partners. 

Pairing is handled randomly. 

### Dice Roll Challenge

You need to write a function that takes in a string in the form: 

`nds`

Where `n` is the number of dice to roll, and `s` is the number of sides.

For example: entering the string: 1d6 would prompt the function to 
return a random number from 1 to 6 simulating the roll of a single 6 
sided die. 

`2d6` should simulate the rolling two 6 sided dice. Which should 
return a number between 2 and 12. Keep in mind that a random number
between 2 and 12 has a different average than generating two random 
values between 1 and 6 and adding them up. We want the later. 

`3d8` should return the sum of rolling an 8 sided die three times. 

Stretch goals 

Your function should handle edge cases: 

1. Handle odd input like: 
  "4 d10", "4 d 10", "4d 10", "4D10" etc. Should all be treated like 4d10.
2. Handles bad input with appropriate output. For example malformed input 
should produce one of the following scenarios: 
  a. Returns undefined.
  b. throws an error.
  c. Returns the results as if 2d6 were the input. 
  
## 2 Sum Problem 

Given an array of integers, find two numbers such that they add up to a specific target number.

The function twoSum should return indices of the two numbers such that they add up to the target, where index1 must be less than index2. Please note that your returned answers (both index1 and index2) are not zero-based.

You may assume that each input would have exactly one solution.

Input: numbers={2, 7, 11, 15}, target=9 Output: index1=0, index2=1

Your twoSum method should take two inputs, first is an array of integers, and a second is the target to sum to:

```python
twoSum([2, 7, 11, 15], 9)
```
  
If you are done with this problem, figure out and write down the Big-O of your twoSum implementation. Try to solve it in O(N) time and space.

 ## 3 Longest Uncommon Subsequence
 
Given a group of two strings, you need to find the longest uncommon subsequence of this group of two strings. The longest uncommon subsequence is defined as the longest subsequence of one of these strings and this subsequence should not be any subsequence of the other strings.

A subsequence is a sequence that can be derived from one sequence by deleting some characters without changing the order of the remaining elements. Trivially, any string is a subsequence of itself and an empty string is a subsequence of any string.

The input will be two strings, and the output needs to be the length of the longest uncommon subsequence. If the longest uncommon subsequence doesn't exist, return -1.

```
Example 1:
Input: "aba", "cdc"
Output: 3
Explanation: The longest uncommon subsequence is "aba" (or "cdc"), 
because "aba" is a subsequence of "aba", 
but not a subsequence of any other strings in the group of two strings. 
Note:

Both strings' lengths will not exceed 100.
Only letters from a ~ z will appear in input strings.
```

| Time |      | Activity |           |
|------|------|----------|-----------|
| 15min| 15min| Talk     | Intro     |
| 15min| 30min| Pair     | Sprint 1  |
| 15min| 45min| Pair     | Sprint 2  | 
| 15min| 60min| Pair     | Sprint 3  | 
| 20min| 80min| Discuss  | Reflection| 
