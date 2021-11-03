# Move Zeros
# Given an array nums, write a function to move all 0's to the end of it while maintaining the relative order of the non-zero elements.
# Example:
# Input: [0,1,0,3,12]
# Output: [1,3,12,0,0]
# Example Input: [0,0,11,2,3,4]
# Example Output: [11,2,3,4,0,0]

def movezeroes(alist):
    return [x for x in alist if x != 0] + [x for x in alist if x == 0]



print(movezeroes([0,0,11,2,3,4]))
        