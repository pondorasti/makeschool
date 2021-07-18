# A UIKit + Combine Form

**Scenario:** 

You need to implement a Register form. The form has fields for entering: email, password and password confirmation. If all fields are valid, a Register button will be enabled and tell the user their registration was successful.

**Validation criteria:**
- Email should have at least 3 characters
- Password should have at least 5 characters
- Password needs to match the Password Confirmation
- Register button should only be enabled when all of the above is true

[Starter code](https://github.com/Make-School-Labs/MOB2.4-CombineEx1)

## Step 1 - Adding @Published variables

Add the following variables to the ViewController class. These will be the values that will be constantly updated.

```swift
@Published var emailValue: String = ""
@Published var passwordValue: String = ""
@Published var confirmPassValue: String = ""
```

Why? We want to validate the conditions everytime one of these change.

## Step 2 - Updating the Published vars

Whenever the user types, the values for the @Published vars change. Add the delegate method below.

```swift
extension ViewController{
    @objc func textFieldEditingDidChange(_ sender: UITextField) {
        switch sender {
        case emailTextField:
            emailValue = sender.text ?? ""
        case passwordTextField:
            passwordValue = sender.text ?? ""
        case confirmPasswordTextField:
            confirmPassValue = sender.text ?? ""
        default:
            break
        }
    }
}
```


## Step 3 - Adding the target to text fields

The delegate method won't work on it's own. We have to attach the sender to the method. The senders are the instances of UITextField. 

You'll need to add the following target to each of the text fields.

```swift
txt.addTarget(self, action: #selector(textFieldEditingDidChange(_:)), for: UIControl.Event.editingChanged)
```

## Step 4 - Adding Publishers

This publisher will be attached to `emailValue` and whenever it changes it will evaluate if the text has at least 3 characters. If not, it will display the warning message. The return value will be the string with the validated email.

```swift
var validatedEmail: AnyPublisher<String?, Never> {
    return $emailValue.map { emailValue in
        guard emailValue.count > 2 else {
            DispatchQueue.main.async {
                self.emailWarning.isHidden = false
            }
            return nil
        }
        self.emailWarning.isHidden = true
        return emailValue
    }.eraseToAnyPublisher()
}
```

This publisher will be attached to `passwordValue` and `confirmPassValue` whenever one of them changes it will evaluate if the text in both textfields match and if the password is at least 5 characters. If not, it will display the warning message. The return value will be the string with the validated password.

```swift
var validatedPassword: AnyPublisher<String?, Never> {
    return Publishers.CombineLatest($passwordValue, $confirmPassValue)
        .receive(on: RunLoop.main)
        .map { passwordValue, confirmPassValue in
            guard confirmPassValue == passwordValue, passwordValue.count > 4 else {
                self.passwordWarning.isHidden = false
                return nil
            }
            self.passwordWarning.isHidden = true
            return passwordValue
        }.eraseToAnyPublisher()
}
```

This publisher will use the special type [CombineLatest](https://developer.apple.com/documentation/combine/publishers/combinelatest). The return value is a tuple with the values of password and email. This publisher wants to make sure everything is ready to submit and we'll use it to enable/disable the Register button.

```swift
var readyToSubmit: AnyPublisher<(String, String)?, Never> {
    return Publishers.CombineLatest(validatedPassword, validatedEmail)
        .map { passwordValue, emailValue in
            guard let realPassword = passwordValue, let realEmail = emailValue else {
                return nil
            }
            return (realPassword, realEmail)
        }
        .eraseToAnyPublisher()
}
```

## Step 5 - Adding the Subscription

Adding a set to store the subscription.

```swift
private var cancellableSet: Set<AnyCancellable> = []
```

We'll use the assign subscriber to control the `isEnabled` property of the Register button. We first check with map if both the password and email are not nil (we know that by now both value shave passed the validations)

```swift
self.readyToSubmit
    .map { return $0 != nil }
    .receive(on: RunLoop.main)
    .assign(to: \.isEnabled, on: registerButton)
    .store(in: &cancellableSet)
```

This should be all you need to get the form working correctly. Try it out 😀