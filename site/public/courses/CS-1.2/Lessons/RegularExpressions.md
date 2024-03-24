# Regular Expressions

## Activities
- Code review implementations of higher order Markov chains
- Review structures used to build Markov chain and discuss scalability
- Lecture and discussion following [regular expressions slides]
- Build and test regular expressions with [RegExr] and visualize them with [RegExper]

## Objectives
After completing this class session and the associated tutorial challenges, students will be able to ...
- Use regular expressions to clean up and remove junk text from corpus
- Use regular expressions to create a more intelligent word tokenizer

## Resources
- Watch Make School's [regular expressions lecture]
- Review Make School's [regular expressions slides]
- Use Cheatography's [regular expressions cheat sheet] as a reference guide
- Solve interactive challenges in UBC's [regular expressions lab webpage][UBC regex lab]
- Use [RegExr] or [RegEx Pal] to build and test regular expression patterns on text samples
- Use [RegExper] or [Cyrilex] to visualize railroad diagrams of regular expression patterns
- Read StackOverflow answers to questions about using regular expressions to parse HTML: first [some comedic relief][SO match HTML tags] and then [an explanation of why you shouldn't][SO why not HTML]

## Challenges
These challenges are the baseline required to complete the project and course.
Be sure to complete these before next class session and before starting on the stretch challenges below.
- [Page 13: Parsing Text and Clean Up]
    - Remove unwanted junk text (e.g., chapter titles in books, character names in scripts)
    - Remove unwanted punctuation (e.g., `_` or `*` characters around words)
    - Convert HTML character codes to ASCII equivalents (e.g., `&#8212;` to `—`)
    - Normalize punctuation characters (e.g., convert both types of quotes – `‘’` and `“”` – to regular quotes – `''` and `""`)
- [Page 14: Tokenization]
    - Handle special characters (e.g., underscores, dashes, brackets, `$`, `%`, `•`, etc.)
    - Handle punctuation and hyphens (e.g., `Dr.`, `U.S.`, `can't`, `on-demand`, etc.)
    - Handle letter casing and capitalization (e.g., `turkey` and `Turkey`)

## Stretch Challenges
These challenges are more difficult and help you push your skills and understanding to the next level.
- [Page 13: Parsing Text and Clean Up]
    - Make your parser code readable, then improve its organization and modularity so that it's easy to modify in the future
    - Modify your parser so that it can be used as both a module (imported by another script) and as a stand-alone, executable script that, when invoked from the command line with a file argument, will print out the cleaned-up version, which can be redirected into a file
- [Page 14: Tokenization]
    - Make your tokenizer code readable, then improve its organization and modularity so that it's easy to modify in the future
    - Write tests to ensure that you're getting the results you've designed for, then run your tests with controlled input data
    - Come up with at least one other tokenization strategy and compare performance against your original strategy, then find ways to make your tokenizer more efficient


[regular expressions lecture]: https://www.youtube.com/watch?v=roUtBDH3Obc
[regular expressions slides]: https://github.com/Make-School-Courses/CS-1.2-Intro-Data-Structures/blob/master/Slides/RegularExpressions.pdf
[regular expressions cheat sheet]: https://www.cheatography.com/davechild/cheat-sheets/regular-expressions/
[UBC regex lab]: http://www.ugrad.cs.ubc.ca/~cs121/2015W1/Labs/Lab8/lab8.html
[RegExr]: https://regexr.com/
[RegEx Pal]: https://www.regexpal.com/
[RegExper]: https://regexper.com/
[Cyrilex]: https://extendsclass.com/regex-tester.html
[SO match HTML tags]: http://stackoverflow.com/questions/1732348/regex-match-open-tags-except-xhtml-self-contained-tags
[SO why not HTML]: http://stackoverflow.com/questions/590747/using-regular-expressions-to-parse-html-why-not

[Page 13: Parsing Text and Clean Up]: https://www.makeschool.com/academy/tutorial/tweet-generator-data-structures-probability-with-python/parsing-text-and-clean-up-969fe44d-6090-45d0-be85-c12e75cbade6
[Page 14: Tokenization]: https://www.makeschool.com/academy/tutorial/tweet-generator-data-structures-probability-with-python/tokenization-551b78bf-22a5-4c32-8a33-0b5f9e93a0e1
