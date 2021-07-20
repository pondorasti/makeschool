def sequential_search(lst, target):
    for i in range (len(lst)):
        if lst[i] == target:
            return i
    return -1
    
    
def binarySearch(lst, target):
  first = 0
  last = len(lst)-1
  found = False
	
  while first<=last and not found:
    midpoint = (first + last)//2
    if lst[midpoint] == target:
      found = True
    else:
      if target < lst[midpoint]:
        last = midpoint-1
      else:
        first = midpoint+1
	
  return found
      
      
def binarySearch_recursion(lst, target):
  if len(lst) == 0:
	  return False
  else:
      midpoint = len(lst)//2
      if lst[midpoint]==target:
        return True
      else:
        if target<lst[midpoint]:
          return binarySearch_recursion(lst[:midpoint],target)
        else:
          return binarySearch_recursion(lst[midpoint+1:],target)

