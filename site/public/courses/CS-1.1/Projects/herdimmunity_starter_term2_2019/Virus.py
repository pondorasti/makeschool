class Virus:
    '''Represents the virus that will be used to infect people in the simulation'''

    def __init__(self, name, reproduction_num, mortality_num):
        '''Sets up the virus to include the name of the virus, the reproduction number that controls how infectious it is, and the mortality rate or how deadly it is'''
        self.name = name #string
        self.reproduction_num = reproduction_num #a float number between 0.0 and 1.0
        self.mortality_num = mortality_num #a float number between 0.0 and 1.0
