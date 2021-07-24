import time

keep_going = True
times = 2

while keep_going:
    print("Loops are fun!!")
    time.sleep(1)

    times -= 1
    if times <= 0:
        keep_going = False