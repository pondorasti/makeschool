# Setting up push notifications

## setup

Clone this repo for starter code:
[Pusher Starter Code](https://github.com/Product-College-Labs/PusherStarter)

Follow the instructions here for setting up push notifications on the apple developer Portal

[Setup Push on Developer Portal](https://stackoverflow.com/questions/21250510/generate-pem-file-used-to-setup-apple-push-notification)

## Sending push notifications from Ruby

We will be using the [Houston](https://github.com/nomad/houston) gem for delivering push notifications

### Setting up pushes with Houston

```ruby
require 'rubygems'
require 'bundler/setup'

require 'houston'

# Development profile
APN = Houston::Client.development
# Link to directory containing a .pem certificate for pushes
APN.certificate = File.read('certs/pushcert.pem')

## Device we are sending a push to
token = 'A54F112207EBFB3AE320FBF14701197C3E42AC41424EB8B8DB3EC1B5CAF2E403'

# Notification object to be sent to the device above
notification = Houston::Notification.new(device: token)
notification.alert = 'New Items in Cart'
notification.badge = 0
notification.sound = 'sosumi.aiff'
notification.category = 'Purchases'
notification.content_available = true


## Deliver the notification
APN.push(notification)
```

### Generating a .pem file from a .p12

Use this command to create a .pem file from your .p12 file

```shell
openssl pkcs12 -in cert.p12 -out pushcert.pem -nodes -clcerts
```

The _-in_ specifies the input .p12 file and the _-out_ is the new .pem file to be created


## Resources

[Setting up Push on the Developer Portal](https://medium.com/@ankushaggarwal/generate-apns-certificate-for-ios-push-notifications-85e4a917d522)
