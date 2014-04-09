require 'sequel'
require 'dotenv'

Dotenv.load

if ENV['HEROKU_POSTGRESQL_BROWN_URL'].nil?
  DB = Sequel.connect(ENV['DATABASE'])
else
  DB = Sequel.connect(ENV['HEROKU_POSTGRESQL_BROWN_URL'])
end

require './app'

run App