# Bank Account 🏦

## Description
Using object-oriented programming concepts, your task is to create a Python program that simulates a bank account.

## Set Up:
🚨  Before starting the assignment, watch [How to: Setup for a New Assignment](https://youtu.be/MCbDO8IpqZM).

This tutorial walks your through how to set up a new repository, make commits, and push code to Github.


## Requirements

### Submission Requirements:
1. Your submitted code should be in a new (public) repo on Github.
1. Your respository should have a minimum of **5 commits**.
1. Your repositroy should include a README with the name of your project and a description.
1. Submit the link to your repo on Gradescope.
1. Create a demo video. The demo should include a walkthrough of your code and demonstration of how your project works.


### Assignment Requirements:

This bank account should all a user to do  the following:

1. Your Python program should be created in one file called `BankAccount.py`.

1. Define a `BankAccount` class.

1. A bank account should have the following attributes:
   * `full_name` - the full name of the bank account account owner.
   * `account_number` - randomly generated 8 digit number, unique per account.
   * `routing_number` - 9 digit number, this number is the same for all accounts.
   * `balance` - the balance of money in the account, should start at 0.

4. Then define the following methods for the `BankAccount` class:
   * The `deposit` method will take one parameter `amount` and will **add** `amount` to the `balance`. Also, it will print the message: `“Amount Deposited: $X.XX”`

   * The `withdraw` method will take one parameter `amount` and will **subtract** `amount` from the `balance`. Also, it will print a message, like `“Amount Withdrawn: $X.XX”`. If the user tries to withdraw an amount that is greater than the current balance, print `”Insufficient funds.”` and charge them with an overdraft fee of `$10`.

   * The `get_balance` method will `print` a user-friendly message with the account balance and then also `return` the current `balance` of the account.

   * The `add_interest` method adds interest to the users `balance`. The annual interest rate is 1% (i.e. 0.083% per month). Thus, the monthly interest is calculated by the following equation: `interest = balance *  0.00083 `.

   * The `print_receipt` method prints a receipt with the account name, account number, and balance like this:
```
Joi Anderson
Account No.: ****5678
Routing No.: 98765432
Balance: $100.00
```

5. Outside of the BankAccount class, define 3 different bank account examples using the `BankAccount()` object.
   *  Your examples should show you using the different methods above to demonstrate them working.


### Stretch Requirements/Challenges (Optional)
Create a terminal ATM. Be sure to add a method to charge an ATM fee for withdrawing money.

## Rubric
This project will be graded using the [Bank Account Rubric](https://docs.google.com/document/d/1Imm_hjdENa3O2KE-VaFWVAalNp35VJ8TzC_d1UJa07w/edit?usp=sharing/copy)
