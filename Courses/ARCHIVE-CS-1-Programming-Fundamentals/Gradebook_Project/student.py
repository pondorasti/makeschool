
class Student(object):
    '''Class of student objects that will populate each class roster.

    Each student object contains the following attributes:

    _____Attributes_______

    _student_ID: Int.  A unique integer identifier assigned to each student at the object's creation.

    name: String.  The name of the student.

    GPA: Float.  A running average of the student's overall grade in the class. Will be set to None
        until an assignment has been graded and passed to the Assignments dictionary.

    assignments: Dictionary {Assignment name (Str): Grade (Float)}.  A record of all assignments
        the student has completed, and the grade he or she has earned on each.
        Dictionary is empty on initialization

    _____Methods________

        __init__(self, name, student_ID):
            -Requires the student's name passed as a String.
            -Requires the student's student_ID number passed as an Int.
            -Initially sets GPA to None.
            -Initially sets Assignments to an empty Dictionary.

        add_assignment(name, grade):
            expects name as string.
            expects grade as float.
            Adds assignment to Assignment attribute with name as key, grade as value. When finished,
            calls _update_grade_in_class() method to recalculate student average.

        update_assignment_grade(name, grade):
            expects name as string.
            expects grade as float.
            Used to update the grade of an assignment that already exists.
            Uses name argument as key in Assignment Dictionary, and then updates the value to the grade argument.
            Raises an error if name attribute does not already exist in the assignments dictionary.  Calls
            _update_grade_in_class() helper method after updating.

        _update_grade_in_class():
        Expects no inputs.
        Calculates the student's grade in class by dividing the student's cumulative assignment scores
            by the number of total assignments in the Assignment Dictionary. Updates self.GPA with this
            value.
     '''
    def __init__(self, name, student_ID):
         self.name = name
         self.student_ID = student_ID
         self.GPA = None
         self.assignments = {}

    def _update_grade_in_class(self):
        point_total = sum(list(self.assignments.values()))
        num_assignments = len(self.assignments)
        if num_assignments == 0:
            self.GPA = None
        else:
            self.GPA = (point_total / num_assignments)

    def update_grade_for_assignment(self, assignment_name, grade):
        if assignment_name in self.assignments:
            self.assignments[assignment_name] = grade
            self._update_grade_in_class()
        else:
            print("The student does not have any assignment by that name!")

    def delete_assignment(self, assignment_name):
        if assignment_name in self.assignments:
            self.assignments.pop(assignment_name, None)
            self._update_grade_in_class()
        else:
            print("The student does not have any assignment by that name!")

    def add_assignment(self, assignment_name, grade):
        self.assignments[assignment_name] = grade
        self._update_grade_in_class()
