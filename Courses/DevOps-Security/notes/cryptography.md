Cryptogrphy

txt into algorithm produces a cypher

txt -> algorithm -> cypher

sending the cypher back through the algorithm produces the txt

txt <- algorithm <- cypher


Including a key makes this impossible to reverse without the key

txt + key -> algorithm -> cypher

txt X algorithm <- cypher


The enemy knows the algorithms. 
Keeping the key secure is important!
If the system is compromised the key can be 
changes easier than the algorithm. 

Keys can be changed on a time schedule.
Keeping the key hidden is very important. 

Symetric encryption 
uses 1 key
how do you send a key over an unsecure system? 

Asymetric encryption uses 2 keys public and private
When encrypted with the public key cypher text can only be decrypted with the private key
When encrypted with the provate key cypher text can only be decrypted with the public key

RSA - Asymetric encryption used with SSL/TLS used over the internet


Hashing (it's all about integrity)

Hashing has these characteristics 

- variable length input. Fixed length output
- Also called a message digest
- can't be reversed

Load a web page with it's hash
hash the page and compare it to the hash to know that it hasn't been changed. 

Hashing is used to protect the confidentiality.
Passwords should always be stored as hashes. This protects them from hackers
and administrators and acidental view. 

-> Password hashes can be reversed through several methods. 

Hashing functions that have been proven to produce the same output for 
multiple inputs: MD5, SHA-1

SHA-2 (SHA-256, SHA-512), SHA-3 are NOT appropriate for passwords!
They are too quick for hackers to crack using modern GPU, ASICs, FPGAs

PBKDF2, bcrypt, scrypt, Argon2 should be the ONLY functions used to hash passwords
These use thousands of more rounds of hashing and take longer to process. 
This is not enough to be noticed when hashing a single password but it is 
significantly longer against brute force attacks. 


Certificates of Authority CA
The CA constructs a digital cert from the public key provided by a business
to provide to clients

