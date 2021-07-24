# FEW 2.4 Lesson 4

## Review

- Name three reference types in JS? 
- Name three value types in JavaScript?
- What is Electron?

## Review the Current Project

You should be using your product/project (remember that dog fooding disucssion?) looking for improvements. 

- How did you use your product? 
- What did you observe that was working well?
- What did you observe that needed improvement? Name three things...

## Building Electron

The instructions here continue from what was covered in class. If you haven't followed the instructions from class 3 be sure to do that now before continuing. 

The instructions here were compiled from this [article](https://www.codementor.io/@randyfindley/how-to-build-an-electron-app-using-create-react-app-and-electron-builder-ss1k0sfer). 

## Set up a production build 

We need some build scripts. These scripts replace the existing react scripts that come with the CRA boilerplate code.

`yarn add @rescripts/cli @rescripts/rescript-env --dev`

**Note!** The terminal will ask you which version of rescripts you want to install choose the latest by hitting return. 

**Edit** `package.json` and *replace* these keys in scripts with these: 

```JSON
"start": "rescripts start",
"build": "rescripts build",
"test": "rescripts test",
```

Now **add a new file** named `.rescriptsrc.js` with the following contents:

```JS
module.exports = [require.resolve('./.webpack.config.js')]
```

Finally **add another new file** called `.webpack.config.js` with the following contents:

```JS
// define child rescript
module.exports = config => {
  config.target = 'electron-renderer';
  return config;
}
```

Add Electron Builder & Typescript:

`yarn add electron-builder typescript --dev`

**Edit** `package.json` again add:

`"homepage": "./",`

Now **add** these to the `"scripts"` in `package.json`: 

```JSON
"postinstall": "electron-builder install-app-deps",
"preelectron-pack": "yarn build",
"electron-pack": "electron-builder -mw"
```

Now add all of this to package.json

```json
"author": {
  "name": "Your Name",
  "email": "your.email@domain.com",
  "url": "https://your-website.com"
},
"build": {
  "appId": "com.my-website.my-app",
  "productName": "MyApp",
  "copyright": "Copyright © 2019 ${author}",
  "mac": {
    "category": "public.app-category.utilities"
  },
  "files": [
    "build/**/*",
    "node_modules/**/*"
  ],
  "directories": {
    "buildResources": "assets"
  }
},
```


Now, build your app for production: 

`yarn electron-pack`

**NOTE:** Following the instructions from the article I wasn't able to get it to build until I changed: 

`"electron-pack": "build -mw"` 

to:

`"electron-pack": "electron-builder -mw"`

**Note!** I also had trouble building with NodeJS 16. I had to switch to NodeJS 15. 

<!-- 
**Note!** I also added the following to the `electron.js` script. Without these my project wouldn't build.  

```JS
webPreferences: {
  nodeIntegration: true
}
``` -->

## Customizing the App

The `electron.js` file has configuration code that is used to by the process that runs the electron app. The HTML/CSS/JS code that was your original CRA project is displayed by electron and is the user interface for your project.

You can modify the application in a few says. Try changing the size of the app and adding an icon. 

While the icon might not sound important in reality it is. It's the first thing people see when they use your app. So it's a chance to brand your product and set impressions. It's also required to publish your apps to the app store. Without an icon your app will automatically be rejected. 

Icons are actually more complex than you might think. You'll need images for all of the different screen resolutions your app might support. 

- Set window size in `electron.js:11`
	- `mainWindow = new BrowserWindow({width: 400, height: 600});`
- App Icon
	- https://dev.to/onmyway133/changing-electron-app-icon
  - https://www.christianengvall.se/electron-app-icons/
	- https://www.electron.build/icons
	
## Build an Electron App

Your goal is to build a desktop application from your React project. Follow the guide above. Your deliverable is a functioning native app that runs on Mac or Windows. 

- Native App

## After Class



## Resources

- 