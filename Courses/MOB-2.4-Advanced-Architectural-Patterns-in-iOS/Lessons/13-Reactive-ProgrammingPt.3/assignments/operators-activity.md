### As A Class - Discuss the questions posed below each example

__*Example 1:*__ A Combination Operator &mdash; `combineLatest`

Combines up to 8 source Observable sequences into a single new Observable sequence and will begin emitting from the combined Observable sequence the latest elements of each source Observable sequence &mdash; once all source sequences have emitted at least one element &mdash; and also when any of the source Observable sequences emits a new element.

There is also a variant of combineLatest that takes an Array (or any other collection of Observable sequences):

```Swift
  example("Array.combineLatest") {
      let disposeBag = DisposeBag()

      let stringObservable = Observable.just("❤️")
      let fruitObservable = Observable.from(["🍎", "🍐", "🍊"])
      let animalObservable = Observable.of("🐶", "🐱", "🐭", "🐹")

      Observable.combineLatest([stringObservable, fruitObservable, animalObservable]) {
              "\($0[0]) \($0[1]) \($0[2])"
          }
          .subscribe(onNext: { print($0) })
          .disposed(by: disposeBag)
  }
```

> NOTE: Because the combineLatest variant that takes a collection passes an array of values to the selector function, it requires that all source Observable sequences are of the same type.

**Q:** What will be the output of the `print()` function? Why?

<!-- SOLUTION:
This produces:
--- Array.combineLatest example ---
❤️ 🍎 🐶
❤️ 🍐 🐶
❤️ 🍐 🐱
❤️ 🍊 🐱
❤️ 🍊 🐭
❤️ 🍊 🐹 -->


__*Example 2:*__ A Transforming Operator &mdash; `scan`

Begins with an initial `seed value`, and then applies an `accumulator closure` to each element emitted by an Observable sequence, and returns each intermediate result as a single-element Observable sequence.

```swift
  example("scan") {
      let disposeBag = DisposeBag()

      Observable.of(10, 100, 1000)
          .scan(1) { aggregateValue, newValue in
              aggregateValue + newValue
          }
          .subscribe(onNext: { print($0) })
          .disposed(by: disposeBag)
  }

  /* OUTPUT:
  11
  111
  1111
  */
```

**Q:** In this example, the `observable` calls `scan()` on itself. What is the `seed value`? What will the output be?

```Swift
  let observable = Observable<String>.create { (observer) -> Disposable in
      observer.onNext("D")
      observer.onNext("U")
      observer.onNext("M")
      observer.onNext("M")
      observer.onNext("Y")
      return NopDisposable.instance
  }

  observable.scan("") { (lastValue, currentValue) -> String in
  	// The new value emitted is the LAST value emitted + current value:
      return lastValue + currentValue
      }.subscribeNext { (element) in
          print(element)
      }.disposed(disposeBag)
      }
  }
```

<!-- SOLUTION: This will print:
D
DU
DUM
DUMM
DUMMY -->


**Q:** What is this code doing? What advantage might provide?

```Swift
  myButton.rx_tap.scan(false) { lastState, newValue in
      return !lastState
  }
```

*Sources:* </br>
- Rx.playground in RxSwift library
- http://swiftpearls.com/RxSwift-for-dummies-2-Operators.html





<!-- TODO: Add these operators to exercise?

takeUntil

scan
  - has example in RxSwift
    - needs better example?

debounce?

 -->



<!-- TODO: get exercises for Operators  -->
