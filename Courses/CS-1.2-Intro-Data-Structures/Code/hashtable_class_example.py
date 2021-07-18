from linkedlist import LinkedList

keyvalues = [("rose", 10), ("mums", 12), ("daisy", 5)]

#hash table
#array of linked lists
my_hashtable = [LinkedList(), LinkedList(), LinkedList()]

#hash function
def my_hash(key):
    return len(key)

#figure out bucket ids
            #rose                       #3
bucket_id = my_hash(keyvalues[0][0]) % len(my_hashtable)
print(bucket_id)

#add the key value pair to the hash table?
ll_at_bucket = my_hashtable[bucket_id]
ll_at_bucket.append(keyvalues[0])
print(ll_at_bucket)

                            #mums       #3
bucket_id = my_hash(keyvalues[1][0]) % len(my_hashtable)
print(bucket_id)
ll_at_bucket = my_hashtable[bucket_id]
ll_at_bucket.append(keyvalues[1])
print(ll_at_bucket)
            #daisy                          #3
bucket_id = my_hash(keyvalues[2][0]) % len(my_hashtable)
print(bucket_id)
ll_at_bucket = my_hashtable[bucket_id]
ll_at_bucket.append(keyvalues[2])
print(ll_at_bucket)
