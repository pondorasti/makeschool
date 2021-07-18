# Final Project: Herd Immunity Simulation

We're going to create a basic simulation of herd immunity by modeling how a virus moves through a population where some (but not all) of a population is vaccinated against this virus.

This ReadMe (project description and specs) is a draft to help you get started on the project and will be updated with more detail as we improve the project and answer questions.

## Goals

* Finish the code in these files to create a working simulation that creates log files of major events.  
* Design your program to follow the rules of the simulation.
* Get your data for virus name, mortality rate, and reproductive rate from [this Guardian article](https://www.theguardian.com/news/datablog/ng-interactive/2014/oct/15/visualised-how-ebola-compares-to-other-infectious-diseases).  
* During every time step of the simulation, **every sick person** should randomly interact with **100 other people** in the population. The chance of a sick person infecting a person that they interact with is the virus's reproductive rate.  Example: if a virus has a reproductive rate of 15, then, on average, a sick person should infect 15 of the 100 people they interact with during that time step.

### Rules

1. A sick person only has a chance at infecting healthy, unvaccinated people they encounter.  
1. An infected person cannot infect a vaccinated person.  This still counts as an interaction.  
1. An infected person cannot infect someone that is already infected.  This still counts as an interaction.
1. At the end of a time step, an infected person will either die of the infection or get better.  The chance they will die is the percentage chance stored in mortality_rate.  
1. For simplicity's sake, if the person does not die, we will consider them immune to the virus and change is_vaccinated to True when this happens.  
1. Dead people can no longer be infected, either.  Any time an individual dies, we should also change their .infected attribute to False.  
1. All state changes for a person should occur at the **end** of a time step, after all infected persons have finished all of their interactions.  
1. During the interactions, make note of any new individuals infected on this turn.  After the interactions are over, we will change the .infected attribute of all newly infected individuals to True.  1. Resolve the states of all individuals that started the turn infected by determining if they die or survive the infection, and change the appropriate attributes.  
1. The simulation should output a logfile that contains a record of every interaction that occurred during the simulation.  We will use this logfile to determine final statistics and answer questions about the simulation.

### Answer These Questions

Once you have successfully run a simulation, use your python skills to answer to analyze the simulation results
1. What were the inputs you gave the simulation? (Population size, percent vaccinated, virus name, mortality rate,  reproductive rate)
1. What percentage of the population became infected at some point before the virus burned out?
1.  What percentage of the population died from the virus?
1.  Out of all interactions sick individuals had during the entire simulation, how many total interactions did we see where a vaccination saved a person from potentially becoming infected?
<br>
<br>
*When you have answered these questions, please put your answers in a file called 'answers.txt' and commit this to your repo.*

## Getting Started

**Important:**
Please follow these instructions *exactly*. If you skip a step or do them out of order, it may not work correctly or you may not earn credit towards your GitHub commit streak.

### Repository Setup
Set up your local clone of this project repo on your computer.

1. **Clone** (do not *fork*) this repo on GitHub onto your local computer.
  - First open your terminal and navigate into the folder where you keep your projects:
  `cd ~/MakeSchool/Projects` (or something similar for your folders)
  - Then run this command to *clone* the course repo:
  `git clone https://github.com/Make-School-Labs/Herd-Immunity-Simulation.git`
  - Now navigate into the new folder Git just created:
  `cd Herd-Immunity-Simulation`

1. [**Create a new empty repo** on GitHub](https://github.com/new) also named `Herd-Immunity-Simulation` and **do not** initialize it with a ReadMe. (Creating a *new* repo instead of a *fork* allows you to earn credit towards your GitHub commit streak.)

1. **Set the `origin` remote's URL** on your local repo to point to your new repo on GitHub:
`git remote set-url origin https://github.com/<your-username>/Herd-Immunity-Simulation.git`

1. **Push your local repo** to your *remote* GitHub repo to link your `master` branch to your `origin` remote:
`git push -u origin master`

1. **Commit your code** to your local repo frequently (each time you've made meaningful progress).

1. **Push your commits** to your remote GitHub repo when you want to publish and backup your code:
`git push` (the `-u` in the previous command lets you omit `origin master` afterward).

**Let's get coding!** You'll find instructions for what you need to do marked within the files themselves. Anything that you explicitly need to code should be marked with a comment that starts with `#TODO`.

## Running the Program

The program is designed to be run from the command line.  You can do this by running
`python3 simulation.py` followed by the command line arguments in the following order,
separated by spaces:
 {population size} {vacc_percentage} {virus_name} {mortality_rate} {repro_rate} {optional: number of people initially infected (default is 1)}

 Let's look at an example:
 * Population Size: 100,000
 * Vaccination Percentage: 90%
 * Virus Name: Ebola
 * Mortality Rate: 70%
 * Reproduction Rate: 25%
 * People Initially Infected: 10

 Then I would type: <br>
 `python3 simulation.py 100000 0.90 Ebola 0.70 0.25 10` in the terminal.

## Basic Structure

The program consists of 4 classes: `Person`, `Virus`, `Simulation`, and `Logger`.

* `Simulation`: Highest level of abstraction. The main class that runs the entire simulation.
* `Person`: Represents the people that make up the population that the virus is spreading through.
* `Virus`: Models the properties of the virus we wish to simulate.
* `Logger`: A helper class for logging all events that happen in the simulation.

When you run `simulation.py` with the corresponding command-line arguments necessary for a simulation, a simulation object is created.  This simulation object then calls the `.run()` method.  This method should continually check if the simulation needs to run another step using a helper method contained in the class, and then call `.time_step()` if the simulation has not ended yet.  Within the `time_step()` method, you'll find all the logic necessary for actually simulating everything--that is, once you write it.  As is, the file just contains a bunch of method stubs, as well as numerous comments for explaining what you need to do to get everything working.  

## Tips for Success

First, take a look at each of the files.  Get a feel for the methods and attributes in each.  Feel overwhelmed? Don't panic.  Instead, get out a piece of paper or a whiteboard and try to diagram what needs to happen and when using each of the objects and methods. Draw out the data flow.

*_If you don't understand something, talk to your classmates and ask for help!_*

Ask your classmates and teachers for clarification/help/code reviews as needed, or drop in to tutoring hours. Share your questions and insights in the course Slack channel, or book some time to get help from Justin and Phyllis, the course teaching assistants.
Collaboration is encouraged, but be sure that you typed in all the code yourself and the final project is your own!

*Found a bug or a problem? Contact the course instructors or teaching assistants!*

The template code was written in a cottage on the coast of Ireland with spotty power during the strongest hurricane Ireland has seen in 61 years, \[Editor's note: this is 100% true\] so... **there are probably some bugs in the template code**. If you think something doesn't make sense, double check with your classmates and/or the instructor.  If you feel the need to modify the template code to make it work another way, that's totally fine! The template code is there to help you, but it isn't a requirement that you use all of it.

**WRITE TESTS!**

This is a big project.  There's no way that all the code you write is going to work the first time.  Also, see the paragraph above about all of this being coded by a man on a mountain during a 61-year storm while fighting off mountain lions with only a soup-ladle to defend himself.  Starting by thinking about your test cases and aiming for good test coverage is a great way to vaccinate yourself against any pre-existing bugs in the template. Not sure how to write tests? Look at the tests for the Super Hero project and utilize some strategies from those tests.

## Project Completion

For this project to be considered complete, you need to add your repo link to the course tracker. Please do not change the random seed set in the Simulation class! It is currently set to 42, and we will use this to double check that your simulation works and spits out the expected results.

**Your repo should contain:**
  * Completed classes for `logger.py`, `simulation.py`, and `person.py`.
  * The addition of at least 2 additional tests to the `virus.py` file.
  * The addition of at least 3 additional tests to the `person.py` file.
  * At least 1 log file generated from running your simulation.
  * `simulation_test.py` file should be created that allows for testing the simulation.
  * `logger_test.py` file should be created that allows for the testing of the logger class.
  * Answers to the questions asked above listed in a file named `answers.txt`.

### Stretch Challenges

You'll find some of the smaller, individual stretch challenges contained with the comments of the code on the logger class.  Other stretch challenges include:

  * Extending functionality so that we can test the spread of multiple viruses through a given population at the same time. (Difficulty Level: Hard)
  * Create a Visualizer class that can spit out visualizations of the spread of the virus based on the log files of a simulation.  HINT: You'll want to use Matplotlib for visualization stuff, because its easy to use and generally awesome at this sort of thing.  You may also want to consider using a library like Pandas for organizing and cleaning your data in a more professional way, especially if you want to visualize answers to more complex questions.  Matplotlib and Pandas play very nicely together! (Difficulty Level: Medium)
