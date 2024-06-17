require "bundler/inline"

gemfile do
    source "https://rubygems.org"
    gem "sinatra", require: false
    gem "thin"
end

require "sinatra"

get "/" do
    "<h1>Fly me to the moon!</h1>"
end

