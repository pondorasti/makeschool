require 'rubygems'
require 'bundler/setup'

require 'houston'

APN = Houston::Client.development
APN.certificate = File.read('certs/pushcert.pem')

token = 'A54F112207EBFB3AE320FBF14701197C3E42AC41424EB8B8DB3EC1B5CAF2E403'

notification = Houston::Notification.new(device: token)
notification.alert = 'Hello, World!'
notification.badge = 0
notification.sound = 'sosumi.aiff'
notification.category = 'INVITE_CATEGORY'
notification.content_available = true


## Send
APN.push(notification)
