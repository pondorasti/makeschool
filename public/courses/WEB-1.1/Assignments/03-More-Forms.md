# Homework 3: More Forms

## Purpose (Why should I do this?)

You've probably seen forms on nearly every website you've ever visited. For example, on Amazon.com, you can fill out a form to search for a particular item and see relevant results. On Facebook.com, you can fill out forms to sign up, log in, and post a status update!

For this assignment, we'll be practicing using forms to complete more advanced web pages - that do things like filter an image, or complete an API call.

We'll also be practicing using Jinja2 templates to store our HTML code. This will allow you to write much more complex programs that integrate code in multiple languages.

Scoring for this project is as follows:

| Score | Rating | Correctness | Code Quality |
| :---: | :----: | :---------: | :----------: |
| **1** | **Needs Improvement** | Required sections of submission are largely missing or not functional. | Code is messy and hard to follow. Code includes TODOs or does not include docstrings for most routes. |
| **2** | **Basic** | Most routes are functional, but a few may be hard-coded or incorrect. | Some routes have code that is messy and hard to follow. Some routes do not include docstrings. |
| **3** | **Proficient** | All routes are functional and produce the expected result. | Code is clear and easy to follow. Submitted code does not include TODOs. Nearly all functions have docstrings. |
| **4** | **Advanced** | Stretch challenges are complete and demonstrate an advanced understanding of the concepts presented. | Code is extensible and may utilize helper functions, classes, or advanced data structures to aid in readability. |

## Getting Started

If you haven't yet, create a folder to contain your work for this course. If you put it in the `/dev/courses` folder, then the full path would be something like `/dev/courses/web1.1`.

In a terminal window, navigate to your newly created folder and clone the [starter code](https://github.com/Make-School-Labs/WEB-1.1-Homework-3-Forms-Starter):

```
git clone git@github.com:Make-School-Labs/WEB-1.1-Homework-3-Forms-Starter.git Homework-3-More-Forms
```

Next, go to [GitHub.com](https://github.com) and create a new repository for your project. **IMPORTANT: Make sure the box for "Initialize with a README" is NOT checked**. Then, run the following commands to push your starter code to GitHub:

```
git remote set-url origin git@github.com:YOUR_USERNAME/YOUR_REPO_NAME.git
git push -u origin master
```

Refresh the page in your newly-created GitHub repo to make sure your changes were successfully pushed.

Finally, for this assignment, you'll need to install the Pillow and Requests libraries:

```
pip3 install pillow
pip3 install requests
```

## Instructions

### Challenge 1: Compliments

Take a look at the `compliments` route which displays a form to the user, located in `compliments_form.html`. The form contains:

- A text box for the user's name
- A checkbox for choosing whether the user wants compliments (yes/no)
- A dropdown for choosing how many compliments the user would like

Complete the `compliments_results` route and `compliments_results.html` to:

- Greet the user by name
- Only show them compliments if the checkbox was checked
- Show a randomly chosen list of compliments, according to how many the user requested, each in its own separate bullet point

**HINT 1**: You can use the [random.sample()](https://www.w3schools.com/python/ref_random_sample.asp) method to choose a randomly generated subset of a list.

**HINT 2**: Use the `<ul>` (unordered list) and `<li>` (list item) tags to create bullet points. You'll need to use a for loop to cycle through the list of compliments!

### Challenge 2: Animal Facts

Take a look at the `animal_facts` route and `animal_facts.html`. This time, we are using _only one route_ to do _two different things_ - that is, show a form, **and** process & show the results of the form! This can be a little bit confusing at first, but it's how a lot of web pages work. Think about a message board - you don't need to leave the page to construct your next message; it all happens in one web page.

The purpose of this web page is to allow the user to choose an animal from our `animal_to_fact` dictionary (already defined), and see the relevant fact for that animal. So, if I were to add another animal (say, "mountain lion") to the `animal_to_fact` dictionary, it should automatically show up on the web page!

Complete the `TODO`s in the `animal_facts` route and in `animal_facts.html` to:

- Get the animal name that was chosen by the user (if the user hasn't yet filled out the form, it would be `None`)
- Get a list of all animal names in `animal_to_fact` (hint: use `animal_to_fact.keys()` to get all of the keys as a list)
- Display a separate dropdown option for each possible animal name
- Display the animal fact for the user's chosen animal

Stretch challenges:

- Add some more animals to the list!
- Have different kinds of animal facts, e.g. `habitat`, `physical characteristics`, `intelligence` that a user can choose from
- Let the user choose multiple animals to display facts about (hint: use a [select multiple](https://www.w3schools.com/tags/att_select_multiple.asp) element)

### Challenge 3: Image Filter

Take a look at the `image_filter` route and `image_filter.html`. Now we get to do something _really_ cool with our routes - filter an image! That's right, next you'll be developing for the next internet craze, Makestagram!

This web page will allow the user to upload an image from their computer, select a filter type, and see the resulting image. Pretty cool, huh?

Complete the `TODO`s in the `image_filter` route and in `image_filter.html` to:

- Get the user's chosen filter type
- Save the image & apply a filter to the saved image
- Get the full list of filter types (hint: use `filter_types_dict.keys()`) and display in a drop-down
- Show the resulting image to the user

Stretch challenges:

- Add your own image filters! For example, [here](https://appdividend.com/2020/06/22/how-to-convert-pil-image-to-grayscale-in-python/) are instructions on how to make a grayscale filter.
- Try making filters for: sepia tone, one color only (red/green/blue), reverse colors, etc. You'll need to do your own research on how to achieve this!

### Challenge 4: GIF Search API

Take a look at the `gif_search` route and `gif_search.html`. This will be our first foray into making API calls! For this one, we'll be using the Tenor API to search for GIFs based on a search query, then displaying the resulting GIFs.

Complete the `TODO`s in the `gif_search` route and `gif_search.html` to:

- Get the search query & number of GIFs requested by the user
- Add the request parameters to your request for the search query, key, & number of GIFs
- Display each GIF in an `img` tag

Once that is completed, the GIFs should be displayed on the resulting page. There isn't too much to do here! However, to make sure you understand the route, uncomment the print statement (under "Uncomment me") to see the API call results. Make sure you understand how those results are put onto the page in `gif_search.html`! In the next assignment, we'll be using API results more extensively.

## Testing

No tests for this one (yet) but feel free to try writing your own!

## Submission

When you're ready to submit your work, make sure you push all of your changes to GitHub:

```bash
$ git add .
$ git commit -m'Completed all challenges'
$ git push
```

Then, submit your assignment using [Gradescope](https://gradescope.com).

## Resources

1. [Processing Request Data in Flask](https://scotch.io/bar-talk/processing-incoming-request-data-in-flask)
1. [Rendering Pages in Flask Using Jinja](https://hackersandslackers.com/flask-jinja-templates/)