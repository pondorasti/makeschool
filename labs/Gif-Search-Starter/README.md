# How to Use This Starter Code

To create your own repository using this code:

1. Clone the repository onto your computer using the `git clone` command
1. Run `git remote remove origin` to disconnect the code from Make-School-Labs
1. In GitHub.com, create your own repository. **IMPORTANT**: Do not add a README
1. Run `git remote add origin git@github.com:YOUR_USERNAME/YOUR_REPO_NAME.git`, replacing YOUR_USERNAME with your username and YOUR_REPO_NAME with your repository name
1. Now you should be able to add, commit, and push as normal!

# How to Run This Starter Code

You may need to install `flask` and/or `requests`. To do so, run:

```bash
pip3 install flask
pip3 install requests
```

To run, open the folder containing `app.py` in a Terminal instance, and run:

```bash
export FLASK_ENV=development
flask run
```

# Resources

You may find the following resources helpful in your development process:

1. [Tenor API Documentation](https://tenor.com/gifapi/documentation) - useful for understanding which URL we want to visit in order to make an API request for GIFs
1. [BEW 1.1 Lesson on Flask](https://make-school-courses.github.io/BEW-1.1-RESTful-and-Resourceful-MVC-Architecture/#/./Lessons/03-Intro-to-Flask/README)
1. [BEW 1.1 Lesson on Templates](https://make-school-courses.github.io/BEW-1.1-RESTful-and-Resourceful-MVC-Architecture/#/./Lessons/04-Flask-Templating/README)
1. [BEW 1.1 Lesson on APIs](https://make-school-courses.github.io/BEW-1.1-RESTful-and-Resourceful-MVC-Architecture/#/./Lessons/05-URLs-HTTP-REST-and-Reading-Errors/README)
