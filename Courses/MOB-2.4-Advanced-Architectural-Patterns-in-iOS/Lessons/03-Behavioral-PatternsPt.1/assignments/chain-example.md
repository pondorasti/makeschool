# Chain of Responsibility - Example

```swift
class Expenditure {
    private var _amount = Int()
    var amount : Int{
        get{
            return _amount
        }
        set {
            _amount = newValue
        }
    }
    init(amount : Int) {
        self.amount = amount
    }
}

protocol Chain{
    var nextManagementLevel : Chain{ get set }
    func shouldApproveExpenditure(expenditure : Expenditure)
}

class StudentCouncil : Chain {

    private var _nextManagementLevel : Chain?
    var nextManagementLevel : Chain{
        set{
            _nextManagementLevel = newValue
        }
        get{
            return _nextManagementLevel!
        }
    }

    func shouldApproveExpenditure(expenditure : Expenditure) {
        if expenditure.amount > 0 && expenditure.amount < 100 {
            print("A student from the Student Council can approve this expenditure")
        } else {
            if _nextManagementLevel != nil{
                nextManagementLevel.shouldApproveExpenditure(expenditure: expenditure)
            }
        }
    }
}

class StudentExp : Chain {

    private var _nextManagementLevel : Chain?
    var nextManagementLevel : Chain{
        set{
            _nextManagementLevel = newValue
        }
        get{
            return _nextManagementLevel!
        }
    }

    func shouldApproveExpenditure(expenditure : Expenditure) {
        if expenditure.amount > 101 && expenditure.amount < 1000 {
            print("Megan or Lisa can approve this expenditure.")
        } else {
            if _nextManagementLevel != nil{
                nextManagementLevel.shouldApproveExpenditure(expenditure: expenditure)
            }
        }
    }
}

class Dean : Chain {

    private var _nextManagementLevel : Chain?
    var nextManagementLevel : Chain{
        set{
            _nextManagementLevel = newValue
        }
        get{
            return _nextManagementLevel!
        }
    }

    func shouldApproveExpenditure(expenditure : Expenditure) {
        if expenditure.amount > 1001 && expenditure.amount < 10000 {
            print("Anne can approve this expenditure.")
        } else {
            print("This expenditure is too large and won't get approved, sorry.")
        }
    }
}


let studentCouncil = StudentCouncil()
let studentExp = StudentExp()
let dean = Dean()

studentCouncil.nextManagementLevel = studentExp
studentExp.nextManagementLevel = dean

let expenditure = Expenditure(amount: 5)
studentCouncil.shouldApproveExpenditure(expenditure: expenditure)

expenditure.amount = 500
studentCouncil.shouldApproveExpenditure(expenditure: expenditure)

expenditure.amount = 5000
studentCouncil.shouldApproveExpenditure(expenditure: expenditure)

expenditure.amount = 50000
studentCouncil.shouldApproveExpenditure(expenditure: expenditure)

```

[Adapted from this article](https://medium.com/design-patterns-in-swift/design-patterns-in-swift-chain-of-responsibility-pattern-f575c85a43c)
