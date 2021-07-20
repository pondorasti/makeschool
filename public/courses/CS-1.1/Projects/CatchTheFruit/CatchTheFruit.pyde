add_library('sound')
#You will need to install the sound library go to sketch->import library -> Add library -> search for "sound" and install


'''The setup() function is run once, when the program starts. 
It's used to define initial enviroment properties such as screen size and to load media such as images and fonts as the program starts. 
There can only be one setup() function for each program and it shouldn't be called again after its initial execution.'''
def setup():
    #This sets the size of our game screen or "canvas"
    #think of it like a coordinate grid to place images with x,y locations
    
    #TODO: try changing the size and see what happens
    #for more on the coordinate grid in processing: https://processing.org/tutorials/drawing/
    size(640,380)
    
    #These are image objects that will store what our player, background, and fruit will look like
    #TODO: Add the file paths for the images you want to use
    #TODO: Edit the filenames here to change your player, background and fruit images
    #We will fix these globals later
    global playerimage
    playerimage = loadImage("Luma.png")
    global backgroundimage
    backgroundimage = loadImage("moonbg.png")
    global fruitimage
    fruitimage = loadImage("startfruit.png")
    
    
    #TODO: Resize the fruit and player images to fit on the drawing canvas
    #more about resizing: https://processing.org/reference/PImage_resize_.html


    #This object is the music player for the background game music
    #Try changing the filenames to get different sounds
    #TODO: Edit the filename here to change your background music mp3
    backgroundMusicPlayer = SoundFile(this,"Hyperbola.mp3")
    
    #This will be how many frames per second our game will run at
    #Determines how many times per second the draw() function is called
    global framerate
    framerate = 30.0
    
    #Here we tell the background music player to start playing our game music!
    backgroundMusicPlayer.play()
    
    
'''Called directly after setup(), the draw() function continuously 
executes the lines of code contained inside 
its block until the program is stopped or noLoop() is called. 
draw() is called automatically and should never be called explicitly. 
All Processing programs update the screen at the end of draw(), 
never earlier. The number of times draw() executes in each second 
may be controlled with the frameRate() function.'''
def draw():
    
    #Using the information stored inside gameManager
    #We draw the background image and set the frame rate
    background(backgroundimage)
    frameRate(framerate)
    
    #draw the player
    image(playerimage, 50, 50)
    #TODO: draw the fruit image
