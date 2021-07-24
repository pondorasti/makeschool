# Create a Desktop app with Electron

## Description

Your goal is to package the Tutorial project you build in assignment as an electron app that will run on the desktop.

### Why this assignment?

Learning to make software for the desktop offers unique challenges to solve. Use this to fill out your experience.  

## Project requirements

Your tutorial project should be turned into a desktop application built with electron.

You should customize your application to work on the desktop.

- Modify the window size
- Modify the layout of elements
- Personalize the project to make it your own

### Deliverable

Post your completed project to GradeScope.

### Due date

Class 4 - Nov. 4

## Assessing the assignment

| Expectations | Does not meet | Meets                       | Exceeds                           |
|:-------------|:--------------|:----------------------------|:----------------------------------|
| Completion | Project is not working   | Project works and like the tutorial example. | Project is complete and adds new styles and personalized appearance from the tutorial |
| Electron | Project is not built with electron or doesn't run from the desktop | Project works on the desktop | Project works well and shows customized behaviors as a desktop application |

### Sample Electron code

#### Getting Started

- Create a new `electron.js` file in your public directory.
- this file would house the Main process for your electron app
- See instructions on adding electron scripts to your `package.json` file [here](https://github.com/Make-School-Courses/FEW-2.4-Native-Development-with-JavaScript/blob/master/Lessons/Lesson-03.md)
- update the `main` field your package.json to point to this file and include a script to run the electron app `electron-dev`. See sample below:

```json
  "main": "public/electron.js",
  "scripts": {
    "start": "react-scripts start",
    "build": "react-scripts build",
    "test": "react-scripts test",
    "eject": "react-scripts eject",
    "electron-dev": "concurrently \"BROWSER=none npm start\" \"wait-on http://localhost:3000 && electron .\""
  }
```

- Then you can start out with this starter code in that file

```javascript
/** 
 * This sample illustrates a simple electron app
 * packaged from a react project.  
 * 
 * */
// require electron and destructure the app object and Browser Window class from it
const { app, BrowserWindow, Menu, ipcMain } = require('electron');
const path = require('path');
// initialize the mainWindow variable globally
// Place holders for mainWindow so it doesn't get garbage collected
let mainWindow = null;

// set Icon path, if any
const iconPath = path.join(__dirname, 'images', process.platform === 'win32' ? 'icon.ico' : 'icon.png');


// Create an application menu
const menuTemplate = [];
// We can ask the OS for default menus by role(Electron has in built roles), and they will be built for us
const appMenu = { role: 'appMenu' };
const fileMenu = { role: 'fileMenu' }
const editMenu = { role: 'editMenu' };
const windowMenu = { role: 'windowMenu' };

const devMenu = {
  label: 'Options',
  submenu: [
    { role: 'toggleDevTools', label: 'Dev Tools', accelerator: 'F12' },
    { role: 'reload' },
    { role: 'forceReload' },
  ],
}


// Build menu template
if (process.platform === 'darwin') {
  menuTemplate.push(appMenu);
} else {
  menuTemplate.push(fileMenu);
}
menuTemplate.push(editMenu, windowMenu);

// the dev menu only shows when app is not in production
if (process.env.NODE_ENV !== 'production') {
  menuTemplate.push(devMenu);
}

// Build the menu from the template
const menu = Menu.buildFromTemplate(menuTemplate);

// And set it for the application
Menu.setApplicationMenu(menu);

async function createWindow() {
       //create new Browser window with config options 
       mainWindow = new BrowserWindow({
        // set the height and width of the window
        height: 600,
        width: 800,
        webPreferences: {
            nodeIntegration: true,
            enableRemoteModule: true,
            contextIsolation: false,
            // disable background throttling when the window is not focused
            backgroundThrottling: false,
        },
        icon: iconPath,

        // set the default window title. Remember that if the <title> tag
        // in the html document that is loaded by loadUrl is set, this
        //property will be ignored
        title: 'My App title',
    });


    // load index.html document from the react app (make sure to put in the right file path)
    mainWindow.loadURL(`file://${__dirname}/public/index.html`);
    

  /*  Use this if you want the app window to start with dev tools open   
if (process.env.NODE_ENV !== 'production') {
        mainWindow.webContents.openDevTools();
    } 
*/
}

// This method will be called when Electron has finished
// initialization and is ready to create browser windows.
app.on('ready', createWindow);


// Quit when all windows are closed.
app.on('window-all-closed', () => {
    if (process.platform !== 'darwin') {
        app.quit();
    }
});

// On OS X it's common to re-create a window in the app when the
  // dock icon is clicked and there are no other windows open.
app.on('activate', () => {
    // On OS X it's common to re-create a window in the app when the
  // dock icon is clicked and there are no other windows open.
    if (BrowserWindow.getAllWindows().length === 0) {
        createWindow();
    }
});

// Define any IPC or other custom functionality below here
// Remember the four objects to use when 
//communicating between processes(in this case, your react -renderer process- and electron process - main process)
/* 
  - ipcRenderer.send(send messages/data from react process to electron app process)
  - ipcMain.on(receive messages/data from react process)
  - mainWindowwebContents.send(send messages/data from elecrton app process to react process)
  - ipcRenderer.on(receive messages/data from electron app) 
  */

// Sample: To receive message from react side:

ipcMain.on('eventToListenTo', (event, messageReceived) => {
    // do stuff here
})


// Sample: To send message to react side

let messageToSend = 'I am sending Message'
mainWindow.webContents.send('eventToListen', messageToSend)


```
