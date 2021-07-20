# Common Git Issues

Here's a compilation of Git Issues we've encountered during this project. This documentation hopefully helps others solving their git issues faster 🙌🏼


### Make git forget a tracked file

1. Make sure your .gitignore file is up-to-date and contains all the correct patterns you want to ignore.
1. Commit or stash any local changes.

```
# Remove the files from the index
$ git rm -r --cached .

# Add removals to Staging Area
$ git add .

# Commit them
$ git commit -m "Clean up ignored files"
```

[Source](https://www.git-tower.com/learn/git/faq/ignore-tracked-files-in-git/)

### Can't make a PR with my branch

Error message: *"There isn't anything to compare."*

After trying some solutions suggested [here](https://stackoverflow.com/questions/23344320/there-isnt-anything-to-compare-nothing-to-compare-branches-are-entirely-diffe). What ended up working was creating a new branch and bringing the changes over (either manually or with cherry picking 🍒). This new branch was able to create a PR. It's still unknown what was the misstep done in the first place to get to the error message.
