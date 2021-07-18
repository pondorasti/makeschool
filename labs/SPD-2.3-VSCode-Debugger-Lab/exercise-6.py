"""Exercise 6: Using Objects"""

class Person:
    def __init__(self, name, age):
        self.name = name
        self.age = age 

    def introduce_self(self):
        print(f"I am {self.name} and I am {self.age} years old")

    def compare_to(self, other_person):
        if self.age > other_person.age:
            print(f'I am {self.age - other_person.age} years older than '
            f'{person2.name}.')
        elif self.age < other_person.age:
            print(f'I am {other_person.age - self.age} years younger than '
            f'{person2.name}.')
        else:
            print(f'I am the same age as {other_person.name}.')

if __name__ == '__main__':
    person1 = Person('Amy', 31)
    person2 = Person('Mike', 25)

    person1.introduce_self()
    person2.introduce_self()
    person1.compare_to(person2)
    person2.compare_to(person1)