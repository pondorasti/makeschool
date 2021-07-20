# Final Project

## Purpose (Why should I do this?)

Now that we've learned how to use databases to store data, it's important for you to practice creating your own project from scratch - not using starter code that is already partially finished. This will enable you to be more independent as you begin your first intensive following Term 1.

## Topic

You may choose any topic for your project. Some example topics are:

1. A music site where users can upload the lyrics to their favorite songs (Resources: Song & Artist)
2. An e-commerce site where users can review their favorite products (Resources: Product & Review)
3. A blog site where users can make blog posts & comment on others' blog posts (Resources: BlogPost & Comment)

Keep in mind that since we haven't covered user logins/authentication in this course, you won't really be able to restrict access to certain users. Thus, everyone on the site can see every item of each resource.

## Requirements

To meet all requirements, your project must:

- Use two database resources, with a one-to-many relationship between them
- Have at least one of each of: Create, Read (List & Detail), Update, & Delete endpoints
- Have at least 5 routes
- Utilize at least 3 templates
- Create a video demo of your working project

Your work will be evaluated according to the following rubric:

| Score | Rating | Correctness | Code Quality |
| :---: | :----: | :---------: | :----------: |
| **1** | **Needs Improvement** | Required sections of submission are largely missing or not functional. | Code is messy and hard to follow. Code includes TODOs or does not include docstrings for most routes. |
| **2** | **Basic** | Most routes/templates are functional, but a few may be hard-coded or incorrect. | Some routes have code that is messy and hard to follow. Some routes do not include docstrings. |
| **3** | **Proficient** | All routes/templates are functional and produce the expected result. | Code is clear and easy to follow. Submitted code does not include TODOs. Nearly all functions have docstrings. |
| **4** | **Advanced** | Stretch challenges are complete and demonstrate an advanced understanding of the concepts presented. | Code is extensible and utilizes helper functions, classes, or advanced data structures to aid in readability. |

## Starter Code

Clone the code [here](https://github.com/Make-School-Labs/WEB-1.1-Final-Project-Starter) to start:

```bash
git clone git@github.com:Make-School-Labs/WEB-1.1-Final-Project-Starter.git
```

## Step-by-Step Instructions

If you're having trouble getting started, follow these instructions:

### Step 1: Add some fake data

Open up [Robo3T](https://robomongo.org/) or your MongoDB program of choice, and add some data for your resources! If you want, you can do this step later, but I find it helpful to know ahead of time what my data looks like.

### Step 2: Build the List Page

Complete the `list_page()` route & `list.html` to display all items of your primary resource.

### Step 3: Build the Detail Page

Complete the `detail_page()` route and `detail.html` to display one item of your primary resource based on the id passed in via the URL. Make sure that this page is displayed when you click on a resource from the list page.

### Step 4: Build the Create Page

Complete the `create_page()` route and `create.html` to display & process a form to create a new item of your primary resource.

### Step 5: Build the Edit & Delete Pages

Complete the `edit_page()` route and `edit.html` to finish the edit flow. Make sure that there is a way to access the edit page from the detail page for a single item of your resource!

Then, complete the `delete()` route and make sure that there is a way to access it from the detail page (hint: use a form with only a button). 

### Step 6: Add a Secondary Resource

Now, add a secondary resource & do (some of) these steps again! You should at the very least be able to CREATE & READ items of the secondary resource.

## Video Demo

When you're finished implementing your project, you will need to submit a ~3 minute video demonstrating your working project and explaining your code. You can use the [QuickTime program](https://support.apple.com/guide/quicktime-player/welcome/mac) to record a screenshare to submit for this.

## Submission

When you're ready to submit your work, make sure you push all of your changes to GitHub:

```bash
git add .
git commit -m'Completed all challenges'
git push
```

Then, submit your assignment using [Gradescope](https://gradescope.com).