# By Kami Bigdely
# Split temp variable

def save_into_db(info):
    print("saved into databse")


user_input = input('Please enter your username: ')
save_into_db(user_input)
user_input = int(input('Please enter your birth year: '))
age = 2020 - user_input
print("You are",age, "years old.")
