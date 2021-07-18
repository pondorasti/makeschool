################################################################################
# INSTRUCTIONS:
# Complete the TODOS below to add another "enemy" character. When the player 
# collides with the enemy, it should reset points to 0.
# 
# STRETCH CHALLENGES (complete if you've already finished the main challenge):
# 1. Add a "You Lose" screen that shows for 2 seconds if the player collides
#    with an enemy.
# 2. Create multiple enemies that can all fall at once.
################################################################################

import pygame
import random

# Initialize Pygame
pygame.init()
pygame.display.set_caption('Make School Starter Game!')

################################################################################
# VARIABLES
################################################################################

# Constants
SCREEN_WIDTH = 500
SCREEN_HEIGHT = 500

CHARACTER_WIDTH = 40
CHARACTER_HEIGHT = 40

# Color constants
BLACK = (0, 0, 0)
WHITE = (255, 255, 255)
RED = (255, 0, 0)
GREEN = (0, 255, 0)
BLUE = (0, 0, 255)

# Player Variables
player_x = 50
player_y = 50

# Target Variables
target_x = 250
target_y = 0

# TODO: Add variables for the "enemy" character

# Other variables
velocity = 3
points = 0

# Set up the drawing window
screen = pygame.display.set_mode([SCREEN_WIDTH, SCREEN_HEIGHT])


################################################################################
# HELPER FUNCTIONS
################################################################################

def is_colliding(x1, y1, x2, y2, width, height):
    """Returns True if two rectangles are colliding, or False otherwise"""
    # If one rectangle is on left side of the other 
    if (x1 >= x2 + width) or (x2 >= x1 + width):
        return False
  
    # If one rectangle is above the other
    if (y1 >= y2 + height) or (y2 >= y1 + height):
        return False
  
    return True

def draw_text(text, color, font_size, x, y):
    font = pygame.font.SysFont(None, font_size)
    img = font.render(text, True, color)
    screen.blit(img, (x, y))

################################################################################
# GAME LOOP
################################################################################

# Run until the user asks to quit
running = True
while running:
    # Advance the clock
    pygame.time.delay(20)

    # Did the user click the window close button?
    for event in pygame.event.get():
        if event.type == pygame.QUIT:
            running = False

    keys = pygame.key.get_pressed()

    # Update the player
    if keys[pygame.K_LEFT]:
        player_x -= velocity
    if keys[pygame.K_RIGHT]:
        player_x += velocity
    if keys[pygame.K_UP]:
        player_y -= velocity
    if keys[pygame.K_DOWN]:
        player_y += velocity

    # Update the target
    target_y += velocity

    # TODO: Update the enemy's y position based on its velocity

    # If target went off the screen, reset it
    if target_y > SCREEN_HEIGHT: 
        target_y = 0
        target_x = random.random() * (SCREEN_WIDTH - CHARACTER_WIDTH)

    # TODO: If enemy went off the screen, reset it

    # If player collides with target, reset it & increment points
    if is_colliding(player_x, player_y, target_x, target_y, CHARACTER_WIDTH, CHARACTER_HEIGHT):
        points += 1
        target_y = 0
        target_x = random.random() * (SCREEN_WIDTH - CHARACTER_WIDTH)

    # TODO: If player collides with enemy, reset it & set points to 0

    # Fill screen with white
    screen.fill(WHITE)

    # Draw the player as a blue square
    pygame.draw.rect(screen, BLUE, (player_x, player_y, CHARACTER_WIDTH, CHARACTER_HEIGHT))

    # Draw the target as a green square
    pygame.draw.rect(screen, GREEN, (target_x, target_y, CHARACTER_WIDTH, CHARACTER_HEIGHT))

    # TODO: Draw the enemy as a red square

    # Draw the points
    draw_text(text=f'Points: {points}', color=BLACK, font_size=24, x=20, y=20)

    # Update the game display
    pygame.display.update()

# Done! Time to quit.
pygame.quit()