import pygame
import sys

pygame.init()
screen = pygame.display.set_mode((500, 500))
clock = pygame.time.Clock()

x = 0
y = 0

while True:
    for event in pygame.event.get():
        if event.type == pygame.QUIT:
            pygame.quit()
            sys.exit()

    screen.fill(pygame.Color('white'))

    r = pygame.Rect((x, y), (100, 100))
    pygame.draw.rect(screen, pygame.Color('blue'), r)

    pygame.display.update()
    clock.tick(60)

    x += 1
    y += 1

