# Frequency Counting with a Hash Table 📊


## Description

One standard use of a hash table is counting the frequency of words in a file. For this assignment, you will use a hash table to implement a word-frequency counting program. 


## Setup

🚨 Before starting the assignment, watch [How to: Setup for a New Assignment](https://youtu.be/MCbDO8IpqZM).

This tutorial walks you through how to set up a new repository, make commits, and push code to Github.



## Requirements

### Submission Requirements:
1. Your submitted code should be in a new (public) repo on Github.
1. Your repository should have a minimum of **5 commits**. 
1. Your repo should include a README with the name of your project and a description.
1. Create a demo video. The demo should include a walkthrough of your code and demonstration of your project working.
1. [Optional] Upload your video to Google Drive and share a link if Gradescope upload speeds are too slow.
1. Submit the link to your repo and demo on [Gradescope](https://www.gradescope.com/courses/202248/assignments/803584).

### Assignment Overview:

Your program will do the following:
* Count the number of occurrences of each word in the file.
* Print all of the words and their frequencies. 

For example, a text file that contains these lines:

```
I write, erase, rewrite
Erase again, and then
A poppy blooms.
```

would generate this output:
```
a: 1
again: 1
and: 1
blooms: 1
erase: 2
i: 1
poppy: 1
rewrite: 1
then: 1
write: 1
```

Assumptions:
* The starter code handles all of the file I/O and string tokenization discussed below:
* Words will be counted in a case-insensitive manner (For example, in the above example, `Erase` and `erase` are counted as the same word.)
* Punctuation is ignored. You can use a delimiter to ignore the following characters: `, . ; : - ? !`
* Assume that the input file consists of letter-only words (That is, the file will not have words that contain apostrophes such as `isn’t` and `‘tis`).


### Assignment Requirements:

Download the [starter code from here](https://repl.it/@JoiAnderson2/Frequency-Counter-Starter-Code), which includes:

[Click here to download zip file](https://repl.it/@JoiAnderson2/Frequency-Counter-Starter-Code.zip)

* `main.py`
* `HashTable.py`
* `LinkedList.py`
* `Node.py`
* `example.txt`

Your goals are:

Complete the `TODOs` in `HashTable.py`:

1. `create_arr` - Complete the `create_arr` method in `HashTable.py`. Each element of the hash table (arr) is a linked list. This method creates an array (list) of a given size and populates each of its elements with a LinkedList object. Note: Doing `[LinkedList()] * size` does not work.

1. `hash_func` - Complete the `hash_func` method in `HashTable.py`. Create your own hash function. Hash functions are a function that turns each of these keys into an index value that we can use to decide where in our list each key:value pair should be stored. 

1. `insert` - Complete the `insert` method in `HashTable.py`. Should insert a key value pair into the hash table, where the key is the word and the value is a counter for the number of times the word appeared. When inserting a new word in the hash table, be sure to check if there is a Node with the same key in the table already.

1. `print_key_values` - Complete the `print_key_values` method in `HashTable.py`. Traverse through the every Linked List in the table and print the key value pairs (formatted like the above example)



### Stretch Challenges (Optional)
1. Print the total number of distinct words at the beginning of your program.
1. Offer the user a prompt to query the exact count of a particular word.



## Rubric

Coming soon.
