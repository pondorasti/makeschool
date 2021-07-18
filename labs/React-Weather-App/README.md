# React-Weather-App

A simple starter for a weather app built with React and OpenWeatherMap

## Overview

This is a web app built with Create React App. It defines three components to search weather data for a city input. 

### App 

The App component acts as the main entry point for the app. It displays the Weather component as a child. 

### Weather 

The Weather component loads weather data. It handles input from the SearchBar component and uses the ShowWeather component to display weather data that is loaded. 

Imagine this component as both the parent and manager for both SearchBar and ShowWeather components. It displays these components, receives messages from SearchBar, and passes properties to ShowWeather. 

### SearchBar

The SearchBar component contains a form with an input and a submit button. 
