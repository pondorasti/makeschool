from challenges import lcs, lcs_dp, knapsack, knapsack_dp, edit_distance, edit_distance_dp
import unittest

class LongestCommonSubsequenceTests(unittest.TestCase):
    str1 = 'abcdef'
    str2 = 'zayxefbcd'
    str3 = 'taagctaggaccgtcaccttgcactgcgcatcctcgaacgacatcccaatagaacgttcc'
    str4 = 'gcgctacaaggtggaaatctaaggagttaacgcaaggagtctgcttataaacgcactgat'

    def test_lcs_memoized(self):
        """Test the memoized version of LCS."""
        self.assertEqual(lcs(self.str1, self.str2), 4)
        self.assertEqual(lcs(self.str3, self.str4), 35)

    def test_lcs_dp(self):
        """Test the bottom-up, dynamic programming version of LCS."""
        self.assertEqual(lcs_dp(self.str1, self.str2), 4)
        self.assertEqual(lcs_dp(self.str3, self.str4), 35)

class KnapsackTests(unittest.TestCase):
    items1 = [
        # name, weight, value
        ('boots', 10, 60),
        ('tent', 20, 100),
        ('water', 30, 120),
        ('first aid', 15, 70)
    ]
    items2 = [
        # name, weight, value
        ('A', 2, 1),
        ('B', 3, 2),
        ('C', 4, 5),
        ('D', 5, 6)
    ]

    def test_knapsack_recursive(self):
        """Test the memoized version of Knapsack."""
        self.assertEqual(knapsack(self.items1, 50), 230)
        self.assertEqual(knapsack(self.items2, 8), 8)

    def test_knapsack_dp(self):
        """Test the bottom-up version of Knapsack."""
        # self.assertEqual(knapsack_dp(self.items1, 50), 230)
        self.assertEqual(knapsack_dp(self.items2, 8), 8)


class EditDistanceTests(unittest.TestCase):

    def test_edit_distance_memoized(self):
        """Test the memoized version of Edit Distance."""
        self.assertEqual(edit_distance('saturday', 'sunday'), 3)
        self.assertEqual(edit_distance('intention', 'execution'), 5)

    def test_edit_distance_dp(self):
        """Test the bottom-up version of Edit Distance."""
        self.assertEqual(edit_distance_dp('saturday', 'sunday'), 3)
        self.assertEqual(edit_distance_dp('intention', 'execution'), 5)


if __name__ == '__main__':
    unittest.main()