# Written by Kamran Bigdely
# Example for Compose Methods: Extract Method.

import math
xc1 = 4
yc1 = 4.25

xc2 = 53
yc2 = -5.35
# Calculate the distance between the two circle
distance = math.sqrt((xc1-xc2)**2 + (yc1 - yc2)**2)
print('distance', distance)
# *** somewhere else in your program ***
xa = -36
ya = 97

xb = .34
yb = .91
# calcualte the length of vector AB vector which is a vector between A and B points.
length = math.sqrt((xa-xb)*(xa-xb) + (ya-yb)*(ya-yb))
print('length', length)
