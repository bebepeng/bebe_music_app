require 'sequel'
require 'dotenv'

Dotenv.load

env = ENV['DATABASE'] || ENV['HEROKU_POSTGRESQL_BROWN_URL']
DB = Sequel.connect(env)

require './app'

run App