
The RxSwift library currently offers most (but not all) of the standard Rx operators, which are typically grouped into types describing general functional behavior.

Below is a partial list of RxSwift operators by type, followed by only a few of the operators which exemplify each type.


<!-- TODO: add short descriptions of each example below each type -->


**Transforming Operators** &mdash; Operators that transform `Next` event elements emitted by an Observable sequence.

- map, scan, flatMap, flatMapLatest

**Combination Operators** &mdash; Operators that combine multiple source Observables into a single Observable.

- startWith, merge, zip, switchLatest

**Filtering and Conditional Operators** &mdash; Operators that selectively emit elements from a source Observable sequence.

- filter, distinctUntilChanged, take, takeUntil, skip

**Mathematical and Aggregate Operators** &mdash; Operators that operate on the entire sequence of items emitted by an Observable.

- toArray, reduce, concat

**Connectable Operators** &mdash; Connectable Observable sequences resembles ordinary Observable sequences, except that they do not begin emitting elements when subscribed to, but instead, only when their connect() method is called. In this way, you can wait for all intended subscribers to subscribe to a connectable Observable sequence __*before*__ it begins emitting elements.

- publish, replay, multicast

**Error Handling Operators** &mdash; Operators that help to recover from error notifications from an Observable.

- catchError, catchErrorJustReturn, retry


> For more RxSwift operators and examples of each, see the Rx.playground in the RxSwift library, as a starting point for your exploration into RxSwift operators.

...and, by the way, you can also __*create your own operators!*__

https://github.com/ReactiveX/RxSwift/blob/master/Documentation/GettingStarted.md#custom-operators

<!-- TODO: end: You can create your own - show link  -->


<!-- TODO: pick a couple and show examples...esp. those that the class was confused by -->
<!-- TODO: retry()? -->
