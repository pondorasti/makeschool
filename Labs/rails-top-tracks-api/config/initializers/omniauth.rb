require 'rspotify/oauth'

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :spotify, "44fe35e6c43d46c98490fa367880be8e", "1df025e30dba4274be7a5c255fc00e79", scope: 'user-read-email playlist-modify-public user-library-read user-library-modify'
end
