<!-- Run this slideshow via the following command: -->
<!-- reveal-md README.md -w -->


<!-- .slide: class="header" -->

# Keychain 🔐

## [Slides](https://make-school-courses.github.io/MOB-2.1-Local-Persistence-in-iOS/Slides/Lesson6/README.html ':ignore')

<!-- > -->

## Agenda

- Review FileSystem activity
- Keychain

<!-- > -->

## Learning Objectives

- Describe how to handle the Keychain in iOS.
- Implement data storing/retrieval through Keychain.

<!-- > -->

## Keychain

Apps often need access to sensitive user data such as passwords, but keeping the data secure can come at a cost:

Storing data without any encryption = **security risk!** 😰

Prompting the user all the time = **bad user experience!** 😡

<!-- > -->

Keychain services helps solve this problem by providing easy access to encrypted storage.

Your app uses the keychain, along with minimal user interaction, to provide a good user experience. 😌

<!-- > -->

The Keychain services API gives an app a mechanism to store **small bits** of user data in an **encrypted database** called a keychain. 🔐

<!-- > -->

![keychain](assets/keychain.png)

<!-- > -->

## Things to know

- Used to store sensitive information, such as passwords or credit card information.
- Information is stored encrypted.
- Items stored in the keychain belong to a container that is shared by the operating system.
- This means that if you store a key-value pair in the keychain, and delete your app without clearing the keychain, that item will persist.

<!-- > -->

## How?

Keychain Services consists of two parts: an **encrypted database** and **items inserted** into the database .

![keychainhow](assets/keychainhow.png)

<!-- > -->

**Keychain Use Case - Logging in a User**

Saving a password.

![example](assets/example.png)

<!-- > -->

The keychain is automatically unlocked when the user unlocks the device and then locked when the device is locked.

> An app can access only its own keychain items, or those shared with a group to which the app belongs. It can't manage the keychain container itself. - Apple

<!-- > -->

### Terminology

- `SecKeychain` 				 - this is the database

- `SecKeychainItem			 - this is the item saved to the database`

- `SecItemAdd(_:_:)` 			 - adding an item

- `SecItemCopyMatching(_:_:)` 	 - searching for an item

- `SecItemUpdate(_:_:)` 		 - updating an item

- `SecItemDelete(_:)` 			 - deleting an item

- `kSecAttrSynchronizable`		 - make the item sync with iCloud

<!-- > -->

## KeychainSwift

Apple’s API might be complex at first - Open Source Libraries such as
[KeychainSwift](https://github.com/evgenyneu/keychain-swift) will make your life easier!

- Get, set and delete string, boolean and Data Keychain items
- Specify item access security level
- Synchronize items through iCloud
- Share Keychain items with other apps

<!-- > -->

## In Class Activity

Instructions [here](https://github.com/Make-School-Labs/keychainDemo-starter/tree/main)

<!-- > -->

## Resources

1. [Apple Documentation on Keychain](https://developer.apple.com/documentation/security/keychain_services)<br>
1. [Keychain dive in - article](https://medium.com/halcyon-mobile/diving-into-keychain-services-c71782313a3c)<br>
1. [Using keychain to manage user secrets](https://developer.apple.com/documentation/security/keychain_services/keychain_items/using_the_keychain_to_manage_user_secrets)<br>
1. [Keychain items](https://developer.apple.com/documentation/security/keychain_services/keychain_items)
1. [Library used](https://github.com/evgenyneu/keychain-swift)
