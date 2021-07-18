# Original code credit: https://github.com/kiteco/python-youtube-code/blob/master/snake/snake.py
# Video tutorial: https://www.youtube.com/watch?v=9bBgyOkoBQ0

import pygame
import sys
import random

#############################
# Constants
#############################

# Width & height of the game screen, in pixels
SCREEN_WIDTH = 480
SCREEN_HEIGHT = 480

# Width & height of one square, in pixels
SQUARE_SIZE = 20 

# Width & height of the game screen, in # of squares
GRID_WIDTH = SCREEN_WIDTH / SQUARE_SIZE
GRID_HEIGHT = SCREEN_HEIGHT / SQUARE_SIZE

# Directions
UP = (0,-1)
DOWN = (0,1)
LEFT = (-1,0)
RIGHT = (1,0)


#############################
# Snake & Food classes
#############################

class Snake():
    def __init__(self):
        self.length = 1
        # Snake starts with only 1 position, in the middle of the screen
        self.positions = [(int(SCREEN_WIDTH / 2), int(SCREEN_HEIGHT / 2))]
        self.direction = random.choice([UP, DOWN, LEFT, RIGHT])
        self.color = (17, 24, 47)
        self.score = 0

    def get_head_position(self):
        """Return the snake's head position (that the player controls)."""
        return self.positions[0]

    def turn(self, direction):
        """Turn the snake in the given direction (up, down, left, right)."""
        # Snake cannot make 180 degree turns unless it has only 1 position
        if (self.length > 1 and 
                (direction[0] * -1, direction[1] * -1) == self.direction):
            return
        else:
            self.direction = direction

    def move(self):
        """Add a new position & delete an old one"""
        current_pos = self.get_head_position()
        dir_x, dir_y = self.direction # Unpack the direction

        new_x = (current_pos[0] + (dir_x * SQUARE_SIZE)) % SCREEN_WIDTH
        new_y = (current_pos[1] + (dir_y * SQUARE_SIZE)) % SCREEN_HEIGHT
        new_pos = (new_x, new_y) # Pack up the x and y as the new position

        # If the snake collided with itself (i.e. the new position was the same 
        # as one of its existing positions), reset the game
        if len(self.positions) > 2 and new_pos in self.positions[2:]:
            self.reset()
        # If the snake is longer than it's supposed to be, pop the last position
        else:
            self.positions.insert(0,new_pos)
            if len(self.positions) > self.length:
                self.positions.pop()

    def reset(self):
        self.length = 1
        self.positions = [(int(SCREEN_WIDTH / 2), int(SCREEN_HEIGHT / 2))]
        self.direction = random.choice([UP, DOWN, LEFT, RIGHT])
        self.score = 0

    def draw(self,surface):
        for p in self.positions:
            r = pygame.Rect((p[0], p[1]), (SQUARE_SIZE, SQUARE_SIZE))
            pygame.draw.rect(surface, self.color, r)
            pygame.draw.rect(surface, (93, 216, 228), r, 1)

    def handle_keys(self):
        for event in pygame.event.get():
            if event.type == pygame.QUIT:
                pygame.quit()
                sys.exit()
            elif event.type == pygame.KEYDOWN:
                if event.key == pygame.K_UP:
                    self.turn(UP)
                elif event.key == pygame.K_DOWN:
                    self.turn(DOWN)
                elif event.key == pygame.K_LEFT:
                    self.turn(LEFT)
                elif event.key == pygame.K_RIGHT:
                    self.turn(RIGHT)

class Food():
    def __init__(self):
        self.position = (0,0)
        self.color = (223, 163, 49)
        self.randomize_position()

    def randomize_position(self):
        self.position = (
            random.randint(0, GRID_WIDTH - 1) * SQUARE_SIZE,
            random.randint(0, GRID_HEIGHT - 1) * SQUARE_SIZE
        )

    def draw(self, surface):
        r = pygame.Rect((self.position[0], self.position[1]), (SQUARE_SIZE, SQUARE_SIZE))
        pygame.draw.rect(surface, self.color, r)
        pygame.draw.rect(surface, (93, 216, 228), r, 1)

def drawGrid(surface):
    for y in range(0, int(GRID_HEIGHT)):
        for x in range(0, int(GRID_WIDTH)):
            if (x + y) % 2 == 0: # for all even squares
                r = pygame.Rect((x * SQUARE_SIZE, y * SQUARE_SIZE), (SQUARE_SIZE, SQUARE_SIZE))
                pygame.draw.rect(surface,(93, 216, 228), r)
            else: # for all odd squares
                rr = pygame.Rect((x * SQUARE_SIZE, y * SQUARE_SIZE), (SQUARE_SIZE, SQUARE_SIZE))
                pygame.draw.rect(surface, (84, 194, 205), rr)


#############################
# Game loop
#############################

def main():
    pygame.init()

    # Setup code
    clock = pygame.time.Clock()
    screen = pygame.display.set_mode((SCREEN_WIDTH, SCREEN_HEIGHT), 0, 32)
    framerate = 10 # Re-draw the screen 10 times every second

    drawGrid(screen)

    # Initialize snake & food (only need 1 instance of each)
    snake = Snake()
    food = Food()

    myfont = pygame.font.SysFont("monospace", 16)

    while True:
        clock.tick(framerate) # Advance the clock
        snake.handle_keys() # Handle any key presses
        drawGrid(screen) # Draw the grid (underneath snake & food)
        snake.move() # Move the snake by 1 square

        # If snake collided with food, update accordingly
        if snake.get_head_position() == food.position:
            snake.length += 1
            snake.score += 1
            food.randomize_position()

        snake.draw(screen)
        food.draw(screen)

        text = myfont.render("Score {0}".format(snake.score), 1, (0, 0, 0))
        screen.blit(text, (5,10))
        pygame.display.update()

main()