## Final Project: Herd Immunity Simulation.

As discussed in class, we're going to be creating a basic simulation of herd immunity
by modeling how a virus moves through a population where some (but not all) of a population
is vaccinated against this virus.  

This is just a rough README for now, to help unblock you so that you can get started
started on the project.  I'll update this with more detail in the near future.

### Goals

* Finish the code in these files to create a working simulation that creates log files of major events.  
* The rules of the simulation are as follows:
  * You should get your data for virus name, mortality rate, and basic reproductive rate from the Guardian article we went over in class.  You can find a link to the article in the class slack channel.  
  * During every time step of the simulation, every sick person should randomly interact with 100 other members of the population.  The chance of a sick person infecting a person that they interact with is the virus's basic reproductive rate.  For instance, if virus has a basic reproductive rate of 15, then, on average, a sick person should infect 15 of the 100 people they interact with during a given time step. However, there are caveats to this. A sick person only has a chance at infecting healthy, unvaccinated people they encounter.  
  *  During their interactions with 100 random people from the population, an infected person cannot infect a vaccinated person.  This still counts as an interaction.  
  * Additionally, an infected person cannot infect someone they encounter that is already infected.  This still counts as an interaction.
  * At the end of a time step, an infected person will either die of the infection or get better.  The chance they will die is the percentage chance stored in mortality_rate.  That means that if the mortality rate of a virus is 35%, then every individual with the virus has a 35% chance of dying if they are infected.  For simplicity's sake, if the person does not die, we will consider them immune to the virus.  We will denote this by changing is_vaccinated to True when this happens.  
  * Dead people can no longer be infected, either.  Any time an individual dies, we should also change their .infected attribute to False.  
  * All state changes for a person should occur at the end of a time step, after all infected persons have finished all of their interactions.  During the interactions, we will make note of any new individuals infected on this turn.  After the interactions are over, we will change the .infected attribute of all newly infected individuals to True.  We will also resolve the states of all individuals that started the turn infected here, by determining if they die or survive the infection and changing the appropriate attributes to denote this.  
  * Our simulation should output a logfile that contains a record of every interaction that occured during the simulation.  We will use this logfile to determine final statistics and answer questions about the simulation.
* Once you have successfully run a simulation, use your python skills to answer the following questions about the simulation:
  1. What were the inputs you gave the simulation? (Population size, percent vaccinated, virus name, mortality rate, basic reproductive rate)
  1. What percentage of the population became infected at some point before the virus burned out?
  1.  What percentage of the population died from the virus?
  1.  Out of all interactions sick individuals had during the entire simulation, how many total interactions did we see where a vaccination saved a person from potentially becoming infected?

When you have answered these questions, please put your answers in a file called 'answers.txt' and push this to your repo before slacking me the repo link!


### Getting Started

To get started on this project, fork this repo and then clone the directory from *your own*
fork.  You'll find instructions for what you need to do marked within the files themselves.
Anything  that you explicitly need to code should be marked with a comment that starts with `#TODO`.  

### Running the program

The program is designed to be run from the command line.  You can do this by running
`python3 simulation.py` followed by the command line arguments in the following order,
separated by spaces:
 {population size} {vacc_percentage} {virus_name} {mortality_rate} {basic_repro_num} {optional: number of initially infected people (default is 1)}

 Let's look at an example:

 Population Size: 100,000
 Vacc_percentage: 90%
 Virus Name: Ebola
 Mortality Rate:  70%
 Basic Reproduction Number: 25%
 Initial Infected: 10

 Then I would type `python3 simulation.py 100000 0.90 Ebola 0.70 0.25 10` in the terminal.

### Basic Structure of the program

The program consists of 3 Classes:  Simulation, Logger, and Person.  

* Simulation: Highest level of abstraction. The main class that runs the entire simulation.
* Person: Represents the people that make up the population that the virus is spreading through.
* Logger: A helper class for logging all events that happen in the simulation.

*NOTE*: Although our original in-class discussion for the project noted that we should
also have an Abstract Superclass called Virus and corresponding subclasses for each actual
virus we wanted to simulate, after playing around with the simulation I decided that this wasn't the best approach. Since viruses are static in this simulation and all we really care about is the name of the virus, the mortality rate of the virus, and the rate at which the virus spreads through a population ("Basic Reproduction Number"), I've decided it makes more sense to just store that data as attributes at the Simulation level.

When you run `simulation.py` (with the corresponding command-line arguments necessary for a simulation), a simulation object is created.  This simulation object then calls the `.run()` method.  This method should continually check if the simulation needs to run another step using a helper method contained in the class, and then call `.time_step()` if the simulation has not ended yet.  Within the `time_step()` method, you'll find all the logic necessary for actually simulating everything--that is, once you write it.  As is, the file just contains a bunch of method stubs, as well as numerous comments for explaining what you need to do to get everything working.  

### Some Notes For Being Successful On This Project

First, take a look at each of the files.  Get a feel for the methods and attributes in each.  Feel overwhelmed? Don't panic.  Instead, get out a piece of paper or a whiteboard and try to diagram needs to happen and when using each of the objects and method names.

*_If you don't understand something, ask for help!_*

I'm available on slack all week.  Ask your classmates for clarification/help/code reviews as needed.  Just make sure that your work is still your own!

*Found a bug or a problem? No Problem! Let me know!*

 The template code was written in a cottage on the coast of Ireland with spotty power during the strongest hurricane Ireland has seen in 61 years, so there are probably some bugs in the template code. If you think something doesn't make sense, double check with your classmates and/or me.  If you feel the need to modify the template code to make it work another way, that's totally fine! The template code is there to help you, but it isn't a requirement that you use any/all of it.  

*WRITE TESTS!*

This is a big project.  There's no way that all the code you write is going to work the first time.  Also, see the paragraph above about Mike coding all of this on a mountain during a 50 year storm while fighting off mountain lions with only a soup-ladle to defend himself.  Starting by thinking about your test cases and aiming for good test coverage is a great way to vaccinate yourself against any pre-existing bugs in the template.

*Bugs in the template code? But Mike, you're always telling us to start by writing tests for our code! Are you really trying to tell us that you are giving us template code that you haven't tested yourself yet? Isn't that a bit hypocritical?!*

uh, good point.  But, you see, uh....oops wifi is going out and THERES ANOTHER HURRICANE IT CAME OUT OF NOWHERE UH OH I GOTTA GO NO TIME TO ANSWER THIS QUESTIO___

*What Will I Be Expected To Turn in?*

Great question.  In order for this project to be considered complete, I expect you to slack me a link to a git repo containing working code for the simulation.  Please do not change the random seed set in the Simulation class! It is currently set to 42, and I will be using this to double check that your simulation works and spits out the expected results.  

Your repo should contain:
  * Completed classes for logger.py, simulation.py, and person.py.
  * At least 1 log file generated from running your simulation.  

*What Were the Stretch Challenges for this Project?*

You'll find some of the smaller, individual stretch challenges contained with the comments of the code on the logger class.  Other stretch challenges include:

  * Extending functionality so that we can test the spread of multiple viruses through a given population at the same time. (Difficulty Level: Hard)
  * Create a Visualizer class that can spit out visualizations of the spread of the virus based on the log files of a simulation.  HINT: You'll want to use Matplotlib for visualization stuff, because its easy to use and generally awesome at this sort of thing.  You may also want to consider using a library like Pandas for organizing and cleaning your data in a more professional way, especially if you want to visualize answers to more complex questions.  Matplotlib and Pandas play very nicely together! (Difficulty Level: Medium)

  *As always, I'm available on slack or over email if you have any questions or concerns. Good luck, and happy coding!*

  --Mike
