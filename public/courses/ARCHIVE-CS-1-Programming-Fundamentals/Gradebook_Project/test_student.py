from student import Student
import pytest

def setup_for_test():
    student = Student("Student McStudentFace", 1)
    return student

def test_init_student():
    student = Student("Student McStudentFace", 1)
    assert student.name == "Student McStudentFace"
    assert student.student_ID == 1
    assert student.GPA == None
    assert len(student.assignments) == 0

def test_add_assignment():
    student = setup_for_test()
    student.add_assignment('hw1', 100)
    assert student.assignments['hw1'] == 100
    assert len(student.assignments) == 1
    student.add_assignment('hw2', 90)
    assert student.assignments['hw2'] == 90
    assert len(student.assignments) == 2


def test_delete_assignment():
    student = setup_for_test()
    student.add_assignment('HW1', 100)
    student.add_assignment('Test1', 100)
    student.delete_assignment('HW1')
    assert len(student.assignments) == 1
    student.delete_assignment('Test1')
    assert len(student.assignments) == 0

def test_update_grade_for_assignment():
    '''test updating a grade for a student's assignment '''
    student = setup_for_test()


def test_get_GPA():
    '''tests getting student's average in the class '''
    student = setup_for_test()

def test__update_grade_in_class():
    '''tests helper method _update_grade_in_class().  Any time an assignment and grade are added to a dictionary,
    this method is called.  It recalculates the student's GPA for the class and then updates the value of self.grade_in_class '''
    student = setup_for_test()
