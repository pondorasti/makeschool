from student import Student

class Classroom(object):
    '''
    Classroom object that will act as high-level interface for operations on classroom
    full of students.

    Each Classroom object contains the following attributes:

    _____Attributes_______

    class_name:  String. The name of the class.

    teacher_name: String.  The name of the teacher responsible for the class.

    class_day_and_time:  The days the class meets.

    roster: Dictionary {student_ID (Int): student_object (Student)}. A dictionary of
    students enrolled in the class.  Dictionary is empty on initialization.

    _____Methods________

    init(self, class_name, teacher_name, class_day_and_time):
        - Expects all inputs (aside from self) to be passed as a String.

    enroll_student(student_name):
        - Expects student_name as string.
        - Creates a new student object.
        - Sets the new student's student_ID to self.next_available_student_number
        - increments self.next_available_student_number by 1.
        - adds to roster dictionary, with new student's student_ID as key and student
            object as value.

    add_assignment_for_student(student_name, assignment_name, grade):
        - searches roster for student with student_name.
            - if student does not exist, prints and error message.
        - calls student object's add_assignment() method with assignment_name and grade
            as inputs.

    add_assignment_for_class(assignment_name):
        - Expects assignment_name as String.
        - Loops through each student in self.roster.values().
        - For each student, prints message asking teacher to add grade for student.name
        - Once user has entered input, validates input using _is_valid_grade() method.
            - if input is not valid, asks user again for input.
        - If user input is valid, calls student's add_assignment() method and continues
            through loop.

    drop_assignment_for_student(student_name, assignment_name):
        -  Expects student_name as String.
        -  Expects assignment_name as String.
        -  Loops through roster.values() and finds student with student_name passed in.
            - If student does not exist, prints error message saying so.
        -  Calls student's delete_assignment() method, with assignment_name as input.

    drop_assignment_for_class(assignment_name):
        -  Expects assignment_name as String.
        -  Loops through each student in self.roster.values()
            - Calls student's delete_assignment() method with assignment_name as input.

    get_student_GPA(student_name):
        - Expects student_name as String.
        - Searches self.roster for student with student_name.
            - If no student with that name, prints error message saying so.
        - If found, returns that student's self.GPA attribute.

    get_class_average():
        -  Expects no inputs.
        -  Iterates through all students in self.roster.values() and returns the average
            of their GPA attributes.
    '''

    def __init__(self, class_name, teacher_name, class_day_and_time):
        self.class_name = class_name
        self.teacher_name = teacher_name
        self.class_day_and_time = class_day_and_time
        self.next_available_student_number = 1
        self.roster = {}

    def enroll_student(self, student_name):
        new_student = Student(student_name, self.next_available_student_number)
        self.next_available_student_number += 1
        self.roster[new_student.student_ID] = new_student
        print(new_student.name + ' enrolled successfully!')

    def add_assignment_for_student(self, student_name, assignment_name, grade):
        '''Adds an assignment and corresponding grade for an individual student.'''
        for student in self.roster.values():
            if student.name == student_name:
                student.add_assignment(assignment_name, grade)

    def _is_valid_grade(self, grade):
        try:
            valid_grade = float(grade)
            if valid_grade >= 0:
                return true
        except ValueError:
            return false

    def add_assignment_for_class(self, assignment_name):
        for student in self.roster.values():
            grade = ""
            while not _is_valid_grade(grade):
                grade = float(input("Enter {}'s grade for {}: ".format(student.name,
                                                                       assignment_name)))
            student.add_assignment(assignment_name, grade)


    def drop_assignment_for_student(self, student_name, assignment_name):
        for student in self.roster.values():
            if student.name == student_name:
                student.delete_assignment(assignment_name)

    def drop_assignment_for_class(self, assignment_name):
        for student in self.roster.values():
            student.delete_assignment(assignment_name)

    def get_student_GPA(self, student_name):
        for student in self.roster.values():
            if student.name == student_name:
                return student.GPA

    def get_class_average(self):
        if len(self.roster) == 0:
            print("There are no students enrolled in this class!")
            return None
        else:
            point_total = sum([i.GPA for i in self.roster.values()])
            class_average = point_total / len(self.roster)
            return class_average
