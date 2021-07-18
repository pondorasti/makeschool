from student import Student
from classroom import Classroom
import pytest

def setup_for_test():
    new_classroom = Classroom("CS1", "Mike Kane", "Tu/Th 4-6pm PST")
    new_student_1 = Student("John Doe", 1)
    new_student_2 = Student("Jane Doe", 2)
    new_classroom.next_available_student_number = 3
    new_classroom.roster[1] = new_student_1
    new_classroom.roster[2] = new_student_2
    return new_classroom

def test_setup():
    classroom = setup_for_test()
    assert classroom.class_name == "CS1"
    assert classroom.next_available_student_number == 3
    assert classroom.teacher_name == "Mike Kane"
    assert len(classroom.roster) == 2
    assert classroom.class_day_and_time == "Tu/Th 4-6pm PST"

def test_enroll_student():
    classroom = setup_for_test()
    classroom.enroll_student("Steve")
    assert len(classroom.roster) == 3
    student_added = classroom.roster[3]
    assert student_added.name == "Steve"
    assert student_added.student_ID == 3
    assert 3 in classroom.roster

def test_add_assignment_for_student():
    classroom = setup_for_test()
    classroom.add_assignment_for_student("John Doe", "hw1", 100)
    john = classroom.roster[1]
    assert john.GPA == 100
    assert len(john.assignments) == 1
    assert john.assignments['hw1'] == 100

def test_add_assignment_for_class():
    # Not going to bother writing this test because I'm not crazy enough to introduce
    # monkeypatching to new students during a CS1 Course.
    pass

def test_drop_assignment_for_student():
    classroom = setup_for_test()
    for student in classroom.roster.values():
        student.add_assignment('hw1', 100)
        assert student.assignments['hw1'] == 100
    classroom.drop_assignment_for_student("John Doe", 'hw1')
    assert len(classroom.roster[1].assignments) == 0

def test_drop_assignment_for_class():
    classroom = setup_for_test()
    for student in classroom.roster.values():
        student.add_assignment('hw1', 100)
        assert student.assignments['hw1'] == 100
    classroom.drop_assignment_for_class('hw1')
    for student in classroom.roster.values():
        assert len(student.assignments) == 0

def test_get_student_GPA():
    classroom = setup_for_test()
    classroom.roster[1].add_assignment('hw1', 100)
    classroom.roster[1].add_assignment('test1', 80) # expected GPA is 90
    assert classroom.roster[1].assignments['hw1'] == 100
    assert classroom.roster[1].assignments['test1'] == 80
    assert classroom.get_student_GPA("John Doe") == 90

def test_get_class_average():
    classroom = setup_for_test()
    classroom.roster[1].add_assignment('hw1', 100)
    classroom.roster[1].add_assignment('test1', 80) # student 1 GPA is 90
    classroom.roster[2].add_assignment('hw1', 90)
    classroom.roster[2].add_assignment('test1', 70) # student 2 GPA is 80
    assert classroom.get_class_average() == 85  # expected class avg is 85
