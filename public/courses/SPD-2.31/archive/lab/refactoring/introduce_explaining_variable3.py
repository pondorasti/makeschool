# by Kami Bigdely
# Extract Variable (alias introduce explaining variable)
WELL_DONE = 900000
MEDIUM = 600000
COOKED_CONSTANT = 0.05

def is_cookeding_criteria_satisfied(time, temperature, pressure, desired_state):
    if desired_state == 'well-done' and time * temperature * pressure * COOKED_CONSTANT >= WELL_DONE: 
        return True
    if desired_state == 'medium' and time * temperature * pressure * COOKED_CONSTANT >= MEDIUM:
        return True
    return False