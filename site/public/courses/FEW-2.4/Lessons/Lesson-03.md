# FEW 2.4 Class 3 - Desktop Apps with Electron

## Learning Objectives

1. Build a desktop application with HTML/CSS/JS
1. Create an Electron project with React
1. Dog Fooding...

## Review

- What is `useSelector`? How does it work? 
- what is `useDispatch`? How does it work? 
- Copy this array: `['four', 'score', 'and']`, and add the string `'seven'`
- Copy this object `{ pi: 3.14, gr: 1.618 }` and add property: `en: 2.718`

## What is Electron?

[Electron](https://electronjs.org) is a platform for building desktop applications with JavaScript, HTML, and CSS. It's [open source](https://github.com/electron/electron).

Electron is built on top of the Chrome engine. All of the things that are possible in Chrome are possible in Electron and more. In some ways, you're making an application that runs a single dedicated website with some special privileges not available to websites normally.

Looking deeper Electron is built on a minimal Chromium browser. It uses HTML/CSS/JS to create graphical user interfaces.

Electron uses Node.js and uses the same concepts. Code is written in JS and packages are imported with NPM. 

The main process is named in package.json under "main". Usually "electron.js".

Every window you create a separate **render** process. 

- Main process - core application process Node.js
- Render process - The HTML, CSS, and JS that display in a window.

### Who is using Electron? 

A lot of common apps are using electron. 

- Github Desktop
- Visual Studio Code
- Atom
- Slack 
- WhatsApp
- GraphiQL
- [...many more](https://electronjs.org/apps)

### Why use Electron?

If you know how to make a website you can hack together a desktop app with Electron. 

In most use cases you'll want to make a website. But for cases where you need a desktop app, Electron is probably the fastest easiest way to get there. 

### When do you need a desktop app?

- When you want apps to run **Offline**
- When **security** is an issue
- When you need the **file system**

## Getting started with Electron

Getting started with Electron is easy. Follow the quick start guide to make a "hello world" app with Electron. 

- https://electronjs.org/docs/tutorial/quick-start

You can follow this guide to create a barebones electron app. This is good when you want to experiment. 

If you're making an app with React you have to do a little more work.

Choose a react project you want to turn into a desktop app. 

In the lesson today you will set this app up as a desktop app and get it working in development mode. Development mode is what you will use when you are developing the app. 

## Before Starting! 

During this lesson, you will be building desktop applications that are large binary files. You should not push these to your GitHub repository! 

Add a `.gitignore` if you haven't already. 

Add the following to your `.gitignore`.

```
build/
dist/
node_modules/
```

Commit and push. 

This is **important** because building the application will create a large binary file that you don't want to upload to GitHub! 

## Electron Builder

Electron Builder is a tool that handles a lot of the work of building your electron apps. You'll use it to create a desktop app from the tutorial project you created in the last assignment. You can follow these steps to create a desktop app from any other React project also. 

Note! React apps have some special requirements, they are a little more than simple web pages. They also require a special build process. The steps below create an electron app using a Create React App (CRA) project.

Below I've summarized the steps from this [article](https://www.codementor.io/@randyfindley/how-to-build-an-electron-app-using-create-react-app-and-electron-builder-ss1k0sfer) with a few changes. 

Use one of your existing projects created with creat-react-app. Add the electron dependencies: 

```JSON
yarn add electron electron-builder --dev
yarn add wait-on concurrently --dev
yarn add electron-is-dev
```

**Create a new file**, `public/electron.js`, with the following content.

```JS
const electron = require('electron');
const app = electron.app;
const BrowserWindow = electron.BrowserWindow;

const path = require('path');
const isDev = require('electron-is-dev');

let mainWindow;

function createWindow() {
  mainWindow = new BrowserWindow({
    width: 900, 
    height: 680,
    webPreferences: {
      nodeIntegration: true
  }
});
 mainWindow.loadURL(isDev ? 'http://localhost:3000' : `file://${path.join(__dirname, '../build/index.html')}`);
  if (isDev) {
    // Open the DevTools.
    // BrowserWindow.addDevToolsExtension('<location to your react chrome extension>');
    // Open Chrome web inspector for debug and development
    // mainWindow.webContents.openDevTools();
  }
  mainWindow.on('closed', () => mainWindow = null);
}

app.on('ready', createWindow);

app.on('window-all-closed', () => {
  if (process.platform !== 'darwin') {
    app.quit();
  }
});

app.on('activate', () => {
  if (mainWindow === null) {
    createWindow();
  }
});
```

Add the following to `package.json`: 

```JSON
"main": "public/electron.js",
```

**Add the following** to `"scripts"` in `package.json`: 

```JSON
"electron-dev": "concurrently \"BROWSER=none yarn start\" \"wait-on http://localhost:3000 && electron .\""
```

### Test your Electron app

Use this command to test your electron app in development mode: 

`yarn electron-dev`

You'll use development mode while to test, modify, and add new features to your app. 

## What is Dog Fooding? 

https://en.wikipedia.org/wiki/Eating_your_own_dog_food

In a nutshell, it's using the product you create! How many times have you done this? If the answer is less than the number of products you have created you're missing a big opportunity to improve those products! 

The goal: Now that you have created your desktop app you should use it. 

If you created the password generator save some passwords. Every time you create a password save it to the app. You can mock this up if you don't want to save real passwords (security). Open it and retrieve passwords when you need them. 

If you made the timers app use it to track the time you spend working on homework, studying, reading, working out, and other activities. 

If you made Tetris play the game when you're bored. 

The goal is to identify areas where the app could be improved through real-world use! You will use your work and evaluate it. 

Take notes and make changes to the work. Keep a list of all of these changes.

## Challenges

Follow the instructions above. These should get your Electron app running on the desktop in dev mode. This is what you'll use when you are working locally and making changes.

**Challenge:** Dog food your app! Your goal for this week is to use the app you are working on! The challenge is to use the app at least once a day for its intended purpose. After each use asks yourself: 

- What is working? 
- What is not working? 
- What improvements can I make? 
- Do you have any ideas for new features?

**Challenge:** Follow the instructions above and get your app running in dev mode. 

**Challenge:** Look at your app and think about how you want it to run on the desktop. Think about these ideas: 

Think about the window size. A desktop app might want a fixed window size or to open at a size that works best. 

You can adjust the window size in `electron.js:11`

```JS
mainWindow = new BrowserWindow({ width: 400, height: 600 });
```

**Challenge:** Consider the design of the interface and ask yourself about the elements you see in the window. DO the buttons look like buttons? Does the layout make sense? How could these things be improved? 

Desktop apps should look like software applications rather than web pages. Make some adjustments.

## After Class

The goal this week is to build your Electron app. For this first class get development mode working and use it as your workflow to improve your app. Since every app will be different I'll generalize what you should be working on this week. 

Remember your goal is to make a portfolio project that proves your capabilities. 

- Get the app running in dev mode. This important for testing and seeing how your chosen project will work as a desktop application. 
- Think about your app in the context of a desktop application and consider the user interface. Make changes to the user interface to improve the user experience. 
 - Look closely at buttons and other users interface elements. 
 - Look closely at labels and text content. Does it read well? Can you understand it? can other people understand it? Consider performing a user test or getting feedback from someone else. 
 - Look closely at the layout and arrangement of UI elements. 

## Additional Resources

- [Electron](https://electronjs.org)
- [Electron Apps](https://electronjs.org/apps)
- [Create React App + Electron](https://medium.com/@kitze/%EF%B8%8F-from-react-to-an-electron-app-ready-for-production-a0468ecb1da3)

