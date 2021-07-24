## Welcome to Data Science 1: Databases, Data Analysis, and Visualization!

#### Goals

Here's a short list of the things we'll accomplish in this tutorial.

* Install Anaconda ("Conda", for short)
* Install and verify packages with Conda's package manager
* Use Conda to create and run  a new virtual environment
* Understand the difference between installing packages with Conda, and installing packages in a virtual environment with PIP.
* Run iPython
* Begin using Jupyter Notebooks!


### Step 1: Installing Anaconda

The two most popular languages in Data Science are Python and R.  In our courses, we'll be focusing on Python.  This means we'll have access to awesome Data Science tools in Python, such as Anaconda!

#### What is Anaconda?

Anaconda is a Python distribution built specially for Data Science and Analytics, distributed by a company called Continuum Analytics.  This is free, easy to use, and really, really powerful! If you're doing data science in Python, you can be pretty sure they're using Anaconda.

(From here on out, we'll refer to Anaconda by it's nickname, Conda.)

#### Anaconda vs. Miniconda

We're going to start by installing Conda.  This is fairly straightforward, but just in case you have questions, you can follow [this link](https://conda.io/docs/user-guide/install/macos.html) to the full installation guide for Conda.  

We have two different options for installation: Anaconda and Miniconda.  Functionally, Miniconda is the same as Anaconda--they both contain Conda and the necessary dependencies to run Conda.  The main difference is that Anaconda is much larger, because it also contains the most popular data science packages as well: scipy, numpy, pandas, etc.  Miniconda is smaller, doesn't contain any of these.  

Since we'll be using all of these packages, we'll save ourselves some work by just installing the regular Anaconda package.  You can download it by following [this link](https://www.anaconda.com/download/#macos). (NOTE:  We'll be using Python 3 in this course, so make sure you download the correct version!)

Once you've downloaded the installer, run it and follow the instructions.  When the installation has finished, you'll want to open a terminal and verify the installation worked correctly.  

1.  Open a terminal
2.  run `conda list`

If the installation worked correctly, you should see terminal output listing all the different commands you can use with Conda. If you get an error message saying that the command `conda` is not recognized, try restarting your terminal and running `conda list` again.  


### Step 2: iPython

Now that Conda is up and running, let's play with some of the tools and see what all the fuss is about!

One of the coolest tools in Conda is `iPython`.  iPython is the engine behind Jupyter notebooks, but it's also an interactive python shell that makes coding Python in the terminal bearable.  

Let's begin!

1.  Open the terminal and type `iPython` to open iPython in the terminal.

If you've ever written Python code in the terminal, iPython should feel very familiar.  It's essentially the same experience, but with some added bells and whistles to make life easier, referred to as "magic commands".  For a full list of iPython magic commands, follow [this link](http://ipython.readthedocs.io/en/stable/interactive/magics.html) to see the documentation.


Type the following code (don't copy and paste it!):

```python
def factorial(x):
    '''Computes the factorial of the number passed as input.'''
    total = 1
    while x != 1:
        total *= x
        x -= 1
    return total
  ```

This is a basic function to compute factorials.  If you typed it out, you probably noticed a couple handy features you'd normally have to use a text editor or IDE for, such as:
  * auto-indenting after functions
  * tab for autocomplete
  * color coded key words

  These are really handy benefits usually only found in a text editor, now available directly in the iPython terminal.  Pretty handy! These are nice, but we haven't seen the really cool stuff yet.  

  In the iPython terminal, type `factorial?`.  Now, type `factorial??`.  Pretty cool, huh?

  In iPython, running the name of a function with a `?` at the end will return the function's documentation.  Running the name of a function with `??` at the end will return the docstring, as well as the actual function itself, code included.

  iPython also includes the ability to run bash commands from inside the iPython interpreter.  Can't remember the name of the file you're trying to import?  No problem--just type `%ls` to list the files in your current directory!  Other bash commands also work, such as `cd` and `pwd`.  Just make sure that you put a modulo sign in front of the commands so they'll run in iPython!

  iPython has many more magic commands that are most useful inside a Jupyter notebook--we'll take a look at those soon.  

  As a final step, type `quit()` to end your iPython session.

### Step 3: Package management and Virtual Environments

Another reason people love conda is the seamless ability to manage packages and create virtual environments.  Virtual Environments are a way to manage dependencies, so that your projects don't break every time you update to a newer version of  a framework or library. They do this by taking a snapshot of the dependencies at the version they are currently at in the project inside your virtual environment, so that everything runs smoothly with the correct version number, regardless of what version of the package you have installed outside of the virtual environment.

Conda has the ability manage packages in the same way that you've probably used PIP or easy_install to manage packages. If we wanted to install a package with conda instead of PIP, just type `conda install {package_name}`--for instance, if we wanted to install the popular `pandas` library, we would just type `conda install pandas`.  (There is no need to actually install pandas if you istalled anaconda--this package comes preloaded!)

In order simplify things in this course, we're going to create a virtual environment with conda to do all of our programming in.  For simplicity's sake, we're going to name this virtual environment `DS1`.  To create this virtual environment, simply type:

<center>`conda create -n DS1 python=3.5`</center>

This will create a new virtual environment called DS1, with the default python version set to 3.5. Now, we just have to activate our virtual environment.  To do so, type:

<center>`source activate DS1`</center>

You'll know that you've activated your virtual environment because the prompt in the terminal will now start with `(DS1)`.  

Now that you've started your virtual environment, use `pip` to install any necessary packages--these will not affect the versions of any python packages in your main environment, only install new versions within this virtual environment.  

To deactivate your virtual environment, just type `source deactivate` in the terminal.


### Step 4: Running Jupyter Notebooks and Verifying Installations

The last thing we'll do here is run a Jupyter Notebook.  Jupyter notebooks are a primary tool of data scientists and analysts. Since you installed Conda, you have access to Jupyter.  To start your first Jupyter notebook session, follow these steps:

1. In the terminal, navigate to the folder you want to store all your work.  
2. Make sure your `DS1` virtual environment is activated.
3. Type `jupyter notebook` in the terminal and press enter.

You should see a flurry of activity on your terminal as a result, and then a new browser window should open with the title "Home". You now have a Jupyter notebook server running locally on your machine.  If, for whatever reason, a new browser window does not open, don't worry--you can navigate there yourself.  If you look in the terminal towards the top of the output, you'll see a line that says "The jupyter notebook is running at {...}".  By default, the server runs at localhost:8888--you can always type that in your browser window when the Jupyter server is running.  

Once you see the "Home" screen at localhost:8888, look in the top right corner.  Click on the "New" drop-down button, and under the notebook section, select the one that says "Python\[DS1]".  This will create a new Jupyter Notebook using the DS1 virtual environment you've created as the kernel.  

Alternatively, if you want to open a preexisting Jupyter notebook, just click on it in the menu displayed on the home screen--note that if you didn't navigate to the directory containing the Jupyter notebook before typing `jupyter notebook` in the terminal, you won't see the Jupyter notebook on the home screen!

To verify that everything is installed correctly, open the Jupyter notebook cloned from this repo titled `test_installation.ipynb`.  Follow the instructions in this notebook to verify that you have everything installed correctly!
