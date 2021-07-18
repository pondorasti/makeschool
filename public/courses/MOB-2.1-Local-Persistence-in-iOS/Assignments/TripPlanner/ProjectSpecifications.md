# Trip Planner

<!-- Found this project from previous curriculum, I think it can work for this course -->

## Project Outline

The goal for this project is to build an iOS app that allows users to plan trips. Users can create trips and trips are defined by a name. Trips can also contain a collection of waypoints. Waypoints are represented by a geographic coordinate and a name. Users should be able to create, delete and modify trips.

<!-- Makes sense to include the backend portion of the project? -->

## Data Model Requirements

- **Trips** have a name and a collection of waypoints.
- **Waypoints** have a name (the name returned from the Google Places API) and geographic coordinates.

## Feature Requirements

- Users can _create_ trip by providing a name
- Trips can have a collection of Waypoints (the collection may be empty)
- Waypoints are represented by a geographic coordinate and a name
- Users can _add_ Waypoints to trips by searching the Google Places API for a location name
- Waypoints are _displayed_ on a map
- Users can _remove_ Waypoints
- Users can _remove_ Trips
- Core Data is used to persist all Trips and Waypoints
- Save user settings using any simple persistence method of your preference.
    - For example: distance metrics, currency selector, dark mode preference...
    - _These features don't need to work_, you just want to demonstrate the case of saving simple data.

## Screen Layout Requirements + Example

Below are mockups of the individual screens the app should contain, including their connections to each other. Feel free to design nicer screens than shown in these mockups! They are primarily concerned with the functionality of each screen, not with the specific design or layout. Also, this is missing the settings screen.

**Reminder:** The design of these screens is up to you, but your app must have all of these screens (plus the settings screen)

![image](TripPlanner_ScreenFlow.png)

## Screen Requirements

This section provides requirements for some of the more complex screens.

### Main Screen (List of Trips)

- This screen should support deleting trips by using the iOS swipe-to-delete feature.

### Trip Detail Screen

- If the trip has waypoints, the Trip Detail Screen should show the waypoints for a selected Trip within a _Table View_.
- If the trip doesn't have any waypoints yet, the screen shows another view which has a button to add waypoints
- This screen should support deleting waypoints by using the iOS swipe-to-delete feature.

### Add Waypoint Screen

- This screen allows the user to search for waypoints.
- It displays the search results in a _Table View_.
- The user can select an entry. The selected entry will be highlighted on the map.
- By using the *save* button, it should update the waypoints for the trip.

## Stretch challenges

- Data should be synchronized with a backend system that is set up using Firebase, or any other option of your preference
    - Note: Firebase recommended for speed time and simplicity
- Implement _at least one_ API call that successfully works together with your backend (e.g. only syncing new trips but not changes or deletions, or login in users)
- Add an *Edit* button on the Main Screen and/or the Trip Detail Screen that puts the table view into edit mode; this provides the user with another way of deleting elements.
- Synchronize all Trips and Waypoints with your Server - this should include user authentication so that persisted data is user specific.  
- Use Keychain to store the user's password, maybe try the sync with iCloud feature.
- Include unit testing for at least one module.

Depending on how many challenges you complete, you can earn credit for classwork you missed.

## Project evaluation criteria

[Link to rubric](https://docs.google.com/document/d/19VNDmeijyo0FlcguhDO9PB5nDDoQcZpYF26WJODvB_I/edit?usp=sharing)
