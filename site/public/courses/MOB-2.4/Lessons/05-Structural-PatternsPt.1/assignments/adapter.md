
## Practicing with the Adapter pattern

The following playground code currently is intended to utilize the Adapter pattern to link two incompatible components - an `AudioPlayer` and a `VideoPlayer` class - into an *adapter* class (`MyPlayer` class) which integrates the functionality of each component.

However, none of the classes so far implement a `pause()` function, which is highly desired.

The current code is also incomplete.

**TODO:**

1. Complete the current code so that it it runs and prints:

```swift
Now Playing:  Titanium.aac
Now Playing:  Cat_riding_a_roomba.mp4
```

2. Using the Adapter pattern, add a `pause()` function.

**Playground Code**

```swift
import UIKit

// Target protocol 1
protocol Player {
    func play(audioType: String, fileName: String)
}

// Target protocol 2

    //TODO: Implement a Pause protocol with a pause() function that accepts 1 parameter: A String called "fileName"


// Adaptee 1
class AudioPlayer {
    func playAudio(fileName: String) {
        print("Now Playing: ", fileName)
    }
}

// Adaptee 2
class VideoPlayer {
    func playVideo(fileName: String) {
        print("Now Playing: ", fileName)
    }
}

// Adapter (class)
class MyPlayer: Player {

    //TODO: create required player variables

    func play(audioType: String, fileName: String) {
        if (audioType == ".mp4"){
            videoPlayer.playVideo(fileName: fileName);
        }else if(audioType == ".aac"){
            audioPlayer.playAudio(fileName: fileName);
        }
    }
}

// Adapter (class extension)

    //TODO: Implement a class extension which adds Pause functionality to MyPlayer


// Usage
let myPlayer = MyPlayer()
myPlayer.play(audioType: ".aac", fileName: "Titanium.aac")
myPlayer.play(audioType: ".mp4", fileName: "Cat_riding_a_roomba.mp4")
myPlayer.pause(fileName: "Cat_riding_a_roomba.mp4")


/* This should print:
 Now Playing:  Titanium.aac
 Now Playing:  Cat_riding_a_roomba.mp4
 Cat_riding_a_roomba.mp4  is now paused...
 */
```

*Adapted from this Java code:*
  http://hackjutsu.com/2015/11/07/Adapter%20Pattern/


<!-- SOLUTION FOR ACTIVITY 1 -- is below Additional Resources... -->
