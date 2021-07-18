
# Class 3: Hacking 101 - XSS

Cross Site Scripting or XSS, attacks are created through 
inserting JavaScript into the DOM. These attacks are 
common and one of the easiest type of hacking. 

# Objectives 

- Use XSS to perform hacks
- Identify XSS Exploits
- Recognize XSS Vulnerabilities

## XSS

JavaScript is plain text. The source code for web pages
is delivered to browsers and available for inspection 
by any client, this makes it easy to exploit when web 
apps are not dilligently protected. 

XSS attacks are client side attacks where hackers 
execute malicious code in the browser or insert code into
web content. Usually through forms. 

## XSS Attacks 

The goal of an attack using XSS is to find a way to inject 
code into an existing page. 

Any page that incorporates use input into page content 
is potentially vulnerable to XSS acking. 

**Any input from a user that gets parsed as HTML is an 
opportunity for an XSS attack.**

## What can you do with XSS?

- Malicious code has access to anything the page source
has access to. This can be: 
  - User data
  - Cookies, tokens etc. 
  - Can manipulate the DOM
  - Can send HTTP requests
  - Access to Browser APIs like camera, mic, geolocation etc.
  - Edit page style 
  - Click jacking

## XSS Actors 

- The Website
- The Victim
- The Attacker

## Vectors 

Look at the list [here](https://www.acunetix.com/websitesecurity/cross-site-scripting/)

You'll see that you can attach JavaScript to a variety 
of tags and attributes of tags and the browser will run
that code! 

Chrome and Safari prevent XSS from running immediately but, 
this is not complete protection. Code that gets entered into
a database will not be screened, and this code will be run
on other computers. 

## Activities

- Change your Passwords: The hackers are coming quick 
change your passwords! 
- Post your site to the class Slack channel
- Pick a site to hack. (divide into teams)
  - Keep the hacks civil
  - Bonus points for the creative hack
  
- https://www.hacksplaining.com/lessons
  - Complete each interactive lesson
  - Read the prevention section 
  - Complete the quiz

## Challenges

- Try all of the Hacks in: HOW-TO-EXPLOIT.md
- Work through all of the examples at [Hacksplaining](https://www.hacksplaining.com/lessons)
  - Complete all 25 due: Wed May 9.

## Resources

- https://www.owasp.org/index.php/XSS_(Cross_Site_Scripting)_Prevention_Cheat_Sheet
- https://www.acunetix.com/websitesecurity/cross-site-scripting/
- https://gist.github.com/kurobeats/9a613c9ab68914312cbb415134795b45
- [Hacksplaining](https://www.hacksplaining.com/lessons)
  - Complete each interactive lesson
  - Read the prevention section 
  - Complete the quiz

