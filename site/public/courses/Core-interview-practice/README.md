# Core-interview-practice

## Technical Interview Preparation

Week 2 – Wednesday, February 28th, 2018

Problem Solving Practice Session
	•	10 minutes: Write down ≥3 organizational strategies you’ll use in technical interviews. Discuss your strategies with a partner, and then share with the group.

	•	30 minutes: Solve the programming problems below (in pseudocode or real code) on a small whiteboard (or paper, if you prefer) as if you're in a technical interview.

	•	20 minutes: Find a partner who solved the same problem, explain your solution (strategy and code), and ask for constructive feedback. Then switch and repeat the process to give feedback in the opposite direction.

	•	5 minutes: Discuss organizational strategies and effective interview practices as a group.



Programming Problems
Be sure to analyze the time complexity of your solutions and attempt to improve them.
	1.		Determine whether one string appears within another string in reversed order.
				contains_reversed(‘super bowl’, ‘wob’) => True
				contains_reversed(‘super bowl’, ‘owl’) => False

	2.		Write an efficient function that checks whether any permutation of an input string is a palindrome.
			permutation_palindrome(‘civic’) => True
			permutation_palindrome(‘vicic’) => True
			permutation_palindrome(‘civil’) => False

	3.		Merge k sorted linked lists into a new sorted linked list. (Use the same nodes.)

	4.		Reverse a linked list. (Use the same nodes, do not create new node objects). You can assume this Python class exists:
class ListNode(object):
    def __init__(self, data):
        self.data = data
        self.next = None

	5.		Write a function to find the 2nd largest element in a binary search tree.
