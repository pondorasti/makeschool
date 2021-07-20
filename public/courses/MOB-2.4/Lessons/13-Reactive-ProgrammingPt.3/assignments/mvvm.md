## RX & MVVM

__*Required resources:*__
- Xcode with RxSwift enabled
- the starter app, `MVVMRx_SampleProject-master`

### Part 1 - Individually

__*Exercise 1:*__ Find and examine:

- The `ObserverType protocol` (in RxSwift library)
- Descriptions of `bindTo(_:)` functions (in RxCocoa)

__*Exercise 2:*__ In the starter app, the code for the `albums` scene is complete. But the code for the `tracks` scene needs to be completed in 3 places.

- Search for the 3 `TODO:`s specific to this lesson (there are more than 3 `TODO:`s in the app).
- Using clues from how the `albums` scene was implemented, implement which is missing for each of the 3 `TODO:`s for the `albums` scene

**Q:** For Part 3 of this exercise, what exactly is the nature of the "observable" bound to the code called for each cell/row?

**Q:** In HomeViewModel, note the construction of the 4 PublishSubjects. What benefit(s) does the `error` PublishSubject provide?

### Part 2 - As A Class

**Q:** How does this app implement MVVM?


</br>

*Source for starter app:* </br>
https://medium.com/flawless-app-stories/practical-mvvm-rxswift-a330db6aa693
</br>
