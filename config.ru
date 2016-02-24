require 'bundler'
Bundler.require

require './app'

Dotenv.load

Cloudinary.config do |config|
  config.cloud_name = 'dnuagaf9c'
  config.api_key    = '794973642728529'
  config.api_secret = '3l1kvyhkQf4b_uxE9CKq4oDqTrQ'
end

run Sinatra::Application
