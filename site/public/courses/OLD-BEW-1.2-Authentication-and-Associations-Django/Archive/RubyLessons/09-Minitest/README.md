# Day 9 - Minitest = Max Results

| Time | Activity            |
| ---- | ------------------- |
| 0:05 | Objectives          |
| 0:10 | Initial Exercise    |
| 0:15 | Overview/TT         |
| 0:30 | In Class Activity I |
| 0:50 | BREAK               |
| 1:00 | TT II               |
| 1:20 | In Class Activity II|
| 2:00 | END                 |

## Learning Objectives/Competencies

1. Reinforce TDD and BDD principles by further exploring how Ruby on Rails implements and incorporates both strategies into developer workflow.
1. Gain familiarity with the concepts of integration testing, test fixtures, and acceptance test frameworks.

## Initial Exercise

### Koans = First Ruby TDD Experience (10 Minutes)

Continue working on your Koans. I'm offering a small but unique prize for all students who reach the path to enlightenment in class. Just update the [tracker](https://make.sc/trackbew1.3) accordingly!

## Overview/TT I

### So Many Gems, So Little Time (10 Minutes)

- Testing in the Ruby on Rails ecosystem can be confusing. What gem do you use to accomplish a TDD workflow in Rails? If you search around, you'll find lots of gems that handle testing suites... with so many available options, how can a new Rails developer implement a TDD workflow quickly and painlessly? `cucumber`? `rspec`? Good old fashioned `Test::Unit` perhaps?

Not sure what any of those terms reference? Let's investigate together in the following activity.

## In Class Activity I

### Exploring Efficient Package Evaluation (20 Minutes)

1. Split the class into **three groups**.
1. Assign each group a Ruby / Rails based **testing package to explore**:
    - `RSpec`
    - `Test::Unit`
    - `Cucumber`
1. **Evaluate your assigned package** together as a team!
    - To facilitate **quick evaluation** of a product as a developer, **focus on the following strategies**:
        - What are the _downsides_ to choosing this package?
        - How will this choice _affect my workflow_? My _team's_ workflow?
        - Will you have to _learn something new in order to use it_?
        - Find the open source code. _Is the implementation simple? Or does it look complex?_

## BREAK (10 Minutes)

## Overview/TT II

### Bow Before Minitest (20 Minutes)

Present the infamous [Bow Before Minitest](bow_before_minitest.pdf) slide deck.

## In Class Activity II

### Integration Testing Tutorial (40 Minutes)

Walk through the [following tutorial](https://semaphoreci.com/community/tutorials/integration-testing-ruby-on-rails-with-minitest-and-capybara) individually or in pairs.

This tutorial features integration testing and test fixtures via an acceptance test framework in Ruby on Rails called Capybara.

When you're done with the tutorial, your development environment will be properly configured to leverage this testing strategy in the future!

## Additional Resources

* [Awesome Ruby: Testing](https://ruby.libhunt.com/categories/227-testing) - Great resources to learn more about testing packages in Ruby on Rails.
* [Example: TDD in a Large Ruby Project](https://github.com/comfy/comfortable-mexican-sofa/tree/master/test) - Become familiar with testing in a large Ruby on Rails deployment.
* [GitHub: minitest-rails-capybara](https://github.com/blowmage/minitest-rails-capybara) - The gem used in the tutorial.
* [GitHub: minitest-metadata](https://github.com/wojtekmach/minitest-metadata) - The gem used in the tutorial.

