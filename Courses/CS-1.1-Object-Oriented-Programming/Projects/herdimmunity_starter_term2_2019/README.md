
# Final Project: Herd Immunity Simulation

## Description
We're going to create a basic simulation of herd immunity by modeling how a virus moves through a population where some (but not all) of a population is vaccinated against this virus.

## Learning Outcomes
By completing this project, you should be able to…

1. Applying functions, scope, conditionals, loops, lists, OOP, and file I/O
1. Practice reading spec, code comments, and starter code
1. Practice writing basic tests and running them

## Basic Structure

The program consists of 4 classes: `Person`, `Virus`, `Simulation`, and `FileWriter`.

* `Simulation`: The main class that runs the entire simulation.
* `Person`: Represents the people that make up the population that the virus is spreading through.
* `Virus`: Models the properties of the virus we wish to simulate.
* `FileWriter`: A helper class for writing the results of the simulation.

## Requirements

1. You will need to complete the following method inside the Person class (more details in the starter code):

* `did_survive_infection:` checks wheter the person survived the infection based on the mortality rate

2. You will need to complete the following methods inside the Simulation class (more details in the starter code):

* `print_population:` prints out each person in the population

* `get_infected:` returns a list of all the infected people in the population

* `simulation_should_continue:` determines whether the simulation should continue based on the state of the population

* `determine_survival:` checks if each of the current infected died or survived and became vaccinated, occurs after each time step

* `time_step:` this is where the interactions between an infected person and a random person from the population will be called

* `interaction:` this is where a random person may become infected or vaccinated

3. The Virus and FileWriter classes have already been completed.

4. You will need to write two or more pieces of test code for any part of the program, using pytest is optional. 

5. You will also need to submit two result files simulating a population of 10 and then a population of 100. You are free to make up any virus's you choose.

## Project Submission

This project will be done via pair programming with randomly assinged pairs. In order successfully pass this project you will need to fill out the corresponding project rubric. 
One partner will submit the project github repo link on trinket by the deadline and indicate who their partner was as well. 

### Stretch Challenges

  * Extending functionality so that we can test the spread of multiple viruses through a given population at the same time. (Difficulty Level: Hard)
  * Create a Visualizer class that can spit out visualizations of the spread of the virus based on the log files of a simulation.  HINT: You'll want to use Matplotlib for visualization stuff, because its easy to use and generally awesome at this sort of thing.  You may also want to consider using a library like Pandas for organizing and cleaning your data in a more professional way, especially if you want to visualize answers to more complex questions.  Matplotlib and Pandas play very nicely together! (Difficulty Level: Medium)
