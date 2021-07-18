# Welcome to Software Construction: Key Decisions

## Why You Should Know This (2 min)

Your understanding of how to construct software **determines how good a programmer you are**.

## Learning Objectives (3 min)

1. Identify and describe the steps in formal software construction.
2. Define a convention and their practical uses.
3. Discuss major construction practices.

## Initial Exercise (15 min)

Read through **[Avoiding Classic Mistakes (pdf)](https://2h73ayp5jhv44aq9p3zmp9gd-wpengine.netdna-ssl.com/wp-content/uploads/2017/08/ClassicMistakes.pdf)** --- learn how to **shield your team from classic software engineering mistakes**. Food for thought for the entire term!

## Overview/TT I (30 min)

### What is Software Construction?

Formal software construction contains many surprising steps!

* Problem definition
* Requirements development
* Construction planning
* Software architecture, or high-level design
* Detailed design
* Coding and debugging
* Unit testing
* Integration testing
* Integration System testing
* Corrective maintenance

If you've worked on projects in an informal environment --- like hackathons or intensives --- you might *think* this list represents a lot of process. If you've received your first internship, you've experienced the kind of red tape this process involves in real life!

Engineering excellent software products means **striking the right balance** in your workflow, and we'll explore that throughout the term.

#### The Work in Real Life

What does Software Construction look like in real life?

* Verifying that the groundwork has been laid so that construction can proceed successfully
* Determining how your code will be tested
* Designing and writing classes and routines
* Creating and naming variables and named constants
* Selecting control structures and organizing blocks of statements
* Unit testing, integration testing, and debugging your own code
* Reviewing other team members' low-level designs and code and having them review yours
* Polishing code by carefully formatting and commenting it
* Integrating software components that were created separately
* Tuning code to make it faster and use fewer resources

#### That's Everything, Right?

A lot goes into building a software project. Here's some important non-construction activities that engineers may participate in:

* Management
* Requirements development
* Software architecture
* User-interface design
* System testing
* Maintenance

Each of these activities affects the ultimate success of a project as much as construction! At least the success of any project that calls for more than one or two people and lasts longer than a few weeks.

### Why is Software Construction Important?

Air traffic control. Medical imaging. The Mars rover. Twilio.

What do all these things have in common? They rely on software!

As engineers, improving our software quality and productivity is of utmost importance, even when flying solo. Nearly everything we experience today is a result of some kind of software! Construction is a large part --- the *central activity* --- in software development, and the product of software construction --- the *source code* --- is often the only complete and accurate description of the software.

### Choosing a Programming Language & Why it Matters

> By relieving the brain of all unnecessary work, a good notation sets it free to concentrate on more advanced problems. Before the introduction of the Arabic notation, multiplication was difficult, and the division even of integers called into play the highest mathematical faculties.
>
> Probably nothing in the modern world would have more astonished a Greek mathematician than to learn that a huge proportion of the population of Western Europe could perform the operation of division for the largest numbers. This fact would have seemed to him a sheer impossibility. Our modern power of easy reckoning with decimal fractions is the **almost miraculous result of the gradual discovery of a perfect notation**.
>
> -_Alfred North Whitehead_

The language. Why does it matter? It's what you'll be immersed in the entire time you practice the art of software development.

**Programmers are more productive using a familiar language than an unfamiliar one**. Data from the Cocomo II estimation model shows that programmers working in a **language they’ve used for three years or more are about 30 percent more productive than programmers with equivalent experience who are new to a language.** *(Boehm et al. 2000)*

### Selecting a Convention to Follow

In high-quality software, you can **see a relationship between the conceptual integrity of the architecture and its low-level implementation**. The **implementation must be consistent with the architecture** that guides it **and consistent internally**. That’s the point of construction guidelines for variable names, class names, routine names, formatting conventions, and commenting conventions.

*What if you had a great design for a painting, but one part was classical, one impressionist, and one cubist?* It wouldn’t have conceptual integrity no matter how closely you followed its grand design. It would look like a collage.

A program needs low-level integrity, too.

**Before construction begins, spell out the programming conventions you’ll use**. These details are so low-level that they’re *nearly impossible* to retrofit into software after it’s written.

### Choosing a Construction Practice That Fits

#### Checklist: Major Construction Practices

##### Coding

- [ ] Have you defined how much design will be done up front and how much will be done at the keyboard, while the code is being written?

- [ ] Have you defined coding conventions for names, comments, and layout?

- [ ] Have you defined specific coding practices that are implied by the architecture, such as how error conditions will be handled, how security will be addressed, what conventions will be used for class interfaces, what standards will apply to reused code, how much to consider performance while coding, and so on?

- [ ] Have you identified your location on the technology wave and adjusted your approach to match? If necessary, have you identified how you will program into the language rather than being limited by programming in it?

##### Teamwork

- [ ] Have you defined an integration procedure? That is, have you defined the specific steps a programmer must go through before checking code into the master sources?

- [ ] Will programmers program in pairs, or individually, or some combination of the two?

##### Quality Assurance

- [ ] Will programmers write test cases for their code before writing the code itself?

- [ ] Will programmers write unit tests for their code regardless of whether they write them first or last?

- [ ] Will programmers step through their code in the debugger before they check it in?

- [ ] Will programmers integration-test their code before they check it in?

- [ ] Will programmers review or inspect each other’s code?

##### Tools

- [ ] Have you selected a revision control tool?

- [ ] Have you selected a language and language version or compiler version?

- [ ] Have you selected a framework such as J2EE or Microsoft .NET or explicitly decided not to use a framework?

- [ ] Have you decided whether to allow use of nonstandard language features?

- [ ] Have you identified and acquired other tools you’ll be using—editor, refactoring tool, debugger, test framework, syntax checker, and so on?

## BREAK (10 min)

## In Class Activity I

### Discuss and Reflect (30 min)

1. Get into pairs. **Choose someone who wasn’t in your team last term**.
     1. Discuss the choices your team made in Term 3:
     2. Did your team follow conventions? Which? How did conventions, or the lack thereof, affect your team throughout the term?
     3. How did your team choose what programming language(s) and frameworks to use on the project?
     4. What changes could enhance your experience as a developer?

## In Class Activity II

### Discover (30 min)

1. Ask pairs to join into groups of four.
1. Ask pairs to find and research a few development standards from various companies.
      1. Examples:
            1. Lyft
            2. Medium
            3. *Use [stackshare.io](https://stackshare.io) to find more companies you admire to research!*
2. Compare and contrast the choices these teams made.

## Credits

1. **Code Complete**: Chapters 1 & 4.
