import os
import pusher

# Step 1: Change YOUR_NAME to your own name!
YOUR_NAME = 'Dani'

# Step 2: Choose a color and assign it to YOUR_COLOR.
#   HINT 1: Value should always be a six character hex code with a # in front.
#   HINT 2: Find colors that will look good in the demo here: https://github.com/yeun/open-color#available-colors
YOUR_COLOR = '#FF0000'


# Initialize the Pusher API. DO NOT MODIFY.
p = pusher.Pusher(
    app_id=os.getenv('PUSHER_APP_ID'), 
    key=os.getenv('PUSHER_APP_KEY'), 
    secret=os.getenv('PUSHER_APP_SECRET'),
    cluster=os.getenv('PUSHER_APP_CLUSTER'))


def light_it_up(row, column):
    """
    Changes a single LED on the game board to the color specified in YOUR_COLOR.
    Don't change this function! Do all your work in __main__.

    HINT 1: Row and column indexes start at 1 and end at 33.
    HINT 2: DO NOT change the names of the keys in the event_data dictionary.
    """
    # Data that we'll send to the game board.
    event_data = {
        'name': YOUR_NAME,
        'color': YOUR_COLOR,
        'event': 'led-on',
        'row': row,
        'column': column
    }
    
    # Sending the data through pusher to turn on the LED.
    p.trigger(os.getenv('CHANNEL_NAME'), 'led-on', event_data)

    # Print a success message on the terminal.
    # You should now see your color on the game board!
    print(f'LED at ({row}, {column}) is on! Color: {YOUR_COLOR}')



if __name__ == '__main__':
    # Step 3: Call light_it_up on the line below to get started!
    print('HINT: Remove this print statement and call light_it_up. Be sure to pick an awesome color!')