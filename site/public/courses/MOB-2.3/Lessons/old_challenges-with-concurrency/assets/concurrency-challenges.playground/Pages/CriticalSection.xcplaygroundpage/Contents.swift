import Foundation

// Identify the critical section

func sleepOnTheBed() {}
var roomIsAvailable = true

// We booking rooms in a hotel
// Enter if the room is available
// Thread A ---->
// Thread B ---->
if (roomIsAvailable) {
    // Room is ocupado
    roomIsAvailable = false
    sleepOnTheBed()
    roomIsAvailable = true
} else {
    // Room is not available, wait or do something else
}













