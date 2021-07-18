# SPD 2.31 Labs
This repo houses SPD 2.31 Lab Challenges with an experimental project layout to allows one course repo but separate 'DRY' branch submissions to Gradescope if not individual file upload/drag-and-drop

## OPTIONAL Branch Workflow for Submitting to Gradescope

## Important Notes
- The main repo contains all of the course materials
- Each lesson's challenges are individually contained in their corresponding branch

- First, `clone` the repo
- Then checkout the branch you need.  `git checkout -b <branch-name>`
- If necessary, `git rm -r --cached .` 
- `gitignore` what you need
- When finished, add, Commit and Push your work to that branch and select it when submitting to Gradescope.

### Suggested Branch Names & Corresponding Lessons
| &check; | Class | Topics                                                                                                                                                    | Branch                        |
|-| ----- | --------------------------------------------------------------------------------------------------------------------------------------------------------- | ----------------------------- |
| | 1     | [Debugging Steps](https://docs.google.com/presentation/d/1gHNAh4z_IFsW9lQbBWDtULEDxX7YCjgh9U4NJAivt00/edit?usp=sharing)                                   | `git checkout debug-steps`                   |
| | 2     | [Debugging Techniques](https://docs.google.com/presentation/d/1JFOS4z4hhejgyR7_jBDGOFBywJrqik1Bb18c_sugsDc/edit?usp=sharing)                              | `git checkout debug-techniques`              |
| | 3     | [Using a Debugger](https://docs.google.com/presentation/d/1Lf1UfOtA02nUmL53Gf8CJwqEpaVXicpvSOa-mTuh8rg/edit?usp=sharing)                                  |                               |
| | 4     | [Refactoring - PEP 8](https://docs.google.com/presentation/d/1d-uhUf_7v4PfbMFO_1sFcaRC5koy-hpoPCtq3Oku4ns/edit?usp=sharing)                               | `git checkout pep8-refactor`                 |
| | 5     | [Refactoring - Composing Methods](https://docs.google.com/presentation/d/1vurOh1MhSBfVDTvbFwbgTEEPOgiC7M5pIUt-jCyHIj4/edit?usp=sharing)                   | `git checkout compose-methods-refactor`      |
| | 6     | [Refactoring - Composing Methods 2](https://docs.google.com/presentation/d/1a6NUs6GtLyf4FxIGTFwc_0nCiwDkwPMawY0BtIj1ND8/edit?usp=sharing)                 | `git checkout compose-methods-more` |
| | 7     | [Refactoring - Simplifying Conditional Expressions](https://docs.google.com/presentation/d/1cJyY00m2iAOq1oq_hZCt3_3iNhbu2TqZvEcf3aF4jG4/edit?usp=sharing) | `git checkout simp-conditionals-refactor`    |
| | 8     | [Refactoring - Other Refactoring Techniques](https://docs.google.com/presentation/d/1iHNX9A0Zzi_cjBn_dL1A-7kzB3qO6KbaUXQ9B3IaWT0/edit?usp=sharing)        | `git checkout other-refactor-techniques`     |
| | 9     | Refactoring - Lab                                                                                                                                         |                               |
| | 10    | [Unit Testing 1](https://github.com/Make-School-Courses/SPD-2.31-Testing-and-Architecture/tree/master/lab/pytest)                                         | `git checkout unit-testing`                  |
| | 11    | [Architecture: The Observer Design Pattern](https://docs.google.com/document/d/1jyrxxQyrVxBG9S_hXYI69ytUMdxQdApyM6MO2CwvYj4/edit?usp=sharing)             | `git checkout observer-design-pattern`       |
| | 12    | [Architecture - State Pattern](https://docs.google.com/document/d/1wiD0N9OFVyZz0SASkcnY-cYfIdPfv1SBH9q0ke65rxk/edit?usp=sharing)                          | `git checkout state-design-pattern`          |
| | 13    | Final Exam                                                                                                                                                | `git checkout final-assess`                    |
