class FileWriter:
    '''Helper class to write the results to a file'''

    def __init__(self, filename):
        self.results_file_name = filename

    def init_file(self, virus, population_size, initial_vaccinated, initial_healthy, initial_infected):
        '''Write the simulation initilization information to the file'''
        results_file = open(self.results_file_name, "w")

        results_file.write(f"Simulation for virus: {virus.name}\n")
        results_file.write(f"Reproduction Number: {virus.reproduction_num}, Mortality Number: {virus.mortality_num}\n")
        results_file.write(f"Population Size: {population_size}\n")
        results_file.write(f"Initial Vaccinated: {initial_vaccinated}\n")
        results_file.write(f"Initial Healthy: {initial_healthy}\n")
        results_file.write(f"Initial Infected: {initial_infected}\n")

        results_file.close()
    
    def write_results(self, time_step_counter, total_dead, total_vaccinated):
        '''Write the results of the simulation to the file'''
        results_file = open(self.results_file_name, "a")

        results_file.write(f"\nSimulation Ended after {time_step_counter} turns\n")
        results_file.write(f"Total Dead: {total_dead}\n")
        results_file.write(f"Total Vaccinated: {total_vaccinated}\n")

        results_file.close()