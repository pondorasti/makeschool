
Social Engineering 
Phishing 
Expectation: Showing you understand web security
Job Prospects Roles day to day
What does "we're in" mean?



## Activities
  - Groups present the top 10 attacks of 2017
    - Each group presents for 5 mins with Q & A after
  - Quick chat about cloud
  - Pair and share about AWS services (EC2, S3, lamba, Elastic Beenstalk, Database storage)
    (each group study one of them for 15 min and present)
  - I do, we do: Deploy static html page or document to AWS S3 (ftp, web, ssh)
    - Make this document public available
    - Delete this document afterwards (so you don't get billed)

## Objectives
  - Analyze current attacks from 2017

  - Explain cloud services
  - Deploy code and assets
  - Apply permissions on internet resources

## Challenge
  - Deploy to AWS EC2 or other similar service
    (follow EC2 docs or search for a EC2 deploy tutorial)

## Resources
  - [EC2 deploy docs](https://aws.amazon.com/documentation/ec2/)




## Notes

- https://www.hacksplaining.com/lessons


- We might shorten this lesson to just data security.
  - What data does the internet have
  - why you need to secure the data you store
  - Best practices. Might be good to talk about best practices for storing data.
  
  
Some reading about Botnets and honeypots ...
  - https://en.wikipedia.org/wiki/Botnet
  - https://us.norton.com/internetsecurity-malware-what-is-a-botnet.html
  - https://en.wikipedia.org/wiki/Honeypot_(computing)
  - https://www.sans.edu/cyber-research/security-laboratory/article/honeypots-guide
  

# Botnet class 

Bot nets are very common they cause a lot of trouble... 

some statistics...

why should you know about Bot nets? They are super interesting, and 
they can be used for good! Think cloud computing. 

## What is a botnet? 

Oevrview...

Evil Botnets...

Good botnets...

## Lab Make a botnet in python

Python Bot net
 - http://charlesleifer.com/blog/simple-botnet-written-python/
 - https://github.com/farhan3/py-botnet
 - https://www.cybrary.it/0p3n/python-programming-hackers-part-6-creating-ssh-botnet/
- Botnet in C
 - https://github.com/TreeHacks/botnet-hackpack
 
XSS JavaScript
- https://thehackerblog.com/more-advanced-xss-denial-of-service-attacks/index.html

- [AWS Basics](https://www.inqdo.com/aws-explained-the-basics/?lang=en)
  - [Deploy AWS](https://aws.amazon.com/getting-started/tutorials/deploy-code-vm/)
  - [EC2 docs](https://aws.amazon.com/documentation/ec2/)







## Activities
  - What is the most common explored vulnerability? Bad passwords!
  - Pair and share: Discuss common passwords
  - In groups: Run a brute force script to see how long it takes to get to guess a string
    (e.g.: how long does a it take to guess password `password` or `asdf123` or a stronger password like `B120cd$!`)
    - Use a website/service that creates strong passwords

## Objectives
  - Find and explore vulnerabilities
  - Grasp how websites and apps can be vulnerable and attacked if you have weak passwords
  - Think of ways and techniques to prevent basic attacks such as password guessing

## Challenge
  - Come up with a description that teaches people how to create a strong password following todays guidelines

## Resources
  - http://resources.infosecinstitute.com/popular-tools-for-brute-force-attacks/

## Notes
  - https://codereview.stackexchange.com/questions/68063/brute-force-password-cracker
  - https://gist.github.com/najlepsiwebdesigner/5023781
  - https://stackoverflow.com/questions/6715514/javascript-brute-force-into-web-form
  - http://johannburkard.de/blog/programming/javascript/brute-force-web-password-cracking.html

Maybe we could use this as an assignment or exercise:

- https://www.hackthissite.org
- https://www.hackthis.co.uk

This lesson could be expanded into two or three sessions.

Lesson idea: Password Meter. Build an app that measures password strength.

- https://github.com/dropbox/zxcvbn
