"""Program to demonstrate variable scope. Try it out to see what happens!"""

num_widgets = 10

def change_widgets():
    num_widgets = 5

change_widgets()

print(num_widgets)