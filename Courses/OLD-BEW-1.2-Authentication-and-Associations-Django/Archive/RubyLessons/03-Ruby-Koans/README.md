# Day 3 - Ruby Koans

| Time | Activity                              |
| ---- | ------------------------------------- |
| 0:00 | Objectives                            |
| 0:05 | [Initial Exercise](#environment-setup) |
| 0:20 | [Overview/TT](#why-koans)             |
| 0:35 | [In Class Activity I](#Starting-the-Journey) |
| 0:50 | BREAK                                 |
| 1:00 | [In Class Activity II](#walking-the-path-to-enlightenment) |
| 2:00 | END                                   |

## Learning Objectives/Competencies (5 Minutes)

1. Students will be able to **setup their preferred IDE** and **integrate it with Ruby and Rails**.
1. Students will **gain familiarity "thinking in Ruby"** by implementing a number of [Ruby Koans](http://rubykoans.com/).
1. Students will encounter and exercise the **Red, Green, Refactor** approach to developing Ruby applications.

## Initial Exercise (15 Minutes)

### Environment Setup

Direct students to **read and complete _one_ of the following tutorials**, based on their editor of choice:

- **Atom**: [Atom Tricks for Ruby Developers](https://www.rubyguides.com/2017/11/atom-tricks-for-ruby-developers/)
- **VSCode**: [Ruby on Rails with Visual Studio Code](https://medium.com/@PaulWritesCode/ruby-on-rails-with-visual-studio-code-bc5681a2c098)

## Overview/TT (15 Minutes)

Today's class focuses on **solving problems using the Ruby language**. In order to achieve this, we'll complete a few in-class challenges that solving a [Ruby Koan](http://rubykoans.com) of your choice.

### Why Koans?

> The Koans walk you along the **path to enlightenment** in order to **learn Ruby**. The goal is to **learn the Ruby language, syntax, structure, and some common functions and libraries**. We also teach you **culture**. **Testing** is not just something we pay lip service to, but something we live. It is **essential in your quest to learn** and do great things in the language.

### Encountering a Path to Enlightenment

> The koans are broken out into areas by file, hashes are covered in `about_hashes.rb`, modules are introduced in `about_modules.rb`, etc.

> They are presented in order in the `path_to_enlightenment.rb` file.

> Each koan **builds up your knowledge of Ruby** and **builds upon itself**. It will **stop at the first place you need to correct**.

> Some koans simply need to **have the correct answer substituted for an incorrect one**. Some, however, **require you to supply your own answer**. If you see the method `__` (a double underscore) listed, it is a **hint** to you to **supply your own code in order to make it work correctly**.

## In Class Activity I (25 Minutes)

### Starting the Journey

Instruct the students to **pair up and work on the following challenge** to get started:

1. Run the following code in your terminal _after_ forking this repository. **Make sure to replace the clone link in the first instruction with your fork!**

    ```bash
    git clone git@github.com:droxey/BEW-1.3-Server-Side-Architectures-and-Frameworks.git BEW-1.3-Class-Repo
    ```

1. Navigate to the `Materials/koans` directory.

    ```bash
    cd BEW-1.3-Class-Repo/Materials/koans
    ```

1. **Execute the `path_to_enlightenment.rb` script**. You should receive the following output:

    ```bash
    $ ruby path_to_enlightenment.rb

    AboutAsserts#test_assert_truth has damaged your karma.

    The Master says:
      You have not yet reached enlightenment.

    The answers you seek...
      Failed assertion.

    Please meditate on the following code:
     BEW-1.3-Class-Repo/Materials/koans/about_asserts.rb:10:in `test_assert_truth'

    mountains are merely mountains
    your path thus far [X_________________________________________________] 0/282
    ```

1. Note that the **output tells you where to look for the first error**:

    ```bash
    Please meditate on the following code:
      BEW-1.3-Class-Repo/Materials/koans/about_asserts.rb:10:in `test_assert_truth'
    ```

1. Did you **spot the line number** where the error occurred?

    Observe that the output below the line reading **`Please meditate on the following code`** contains **`about_asserts.rb:10:in 'test_assert_truth'`**.

    Open the `about_asserts.rb` file and **observe the `test_assert_truth` method** within:

    ```ruby
    def test_assert_truth
      assert false # This should be true
    end
    ```

1. **Discuss the output** with your partner:

    - What would you change in order for this **test to pass**?
    - What happens when you **make the change and run the file again**?

## BREAK (10 Minutes)

## In Class Activity II (60 Minutes)

### Walking the Path to Enlightenment

For the remainder of the class period, continue working with your partner, solving each koan in the order in which they appear. **How many koans can you successfully implement before the end of the class period?**

### Daily Deliverable

At the **end of class**, slack the `#bew1-3` channel the following message:

```markdown
*Partner A* and *Partner B* successfully completed *X Ruby Koans*!
```

## After Class

- Continue working on the [Ruby on Rails Guides Tutorial](https://guides.rubyonrails.org/getting_started.html).
  - We'll be diving into Rails next class period!
- Practice Ruby Koans in your spare time in order to level up your Ruby problem solving skills!

## Additional Resources

1. [Ruby-Lang.org](https://www.ruby-lang.org/en/)
1. [Ruby Koans](http://rubykoans.com/)
1. [Ruby Koans on Github](https://github.com/edgecase/ruby_koans)
