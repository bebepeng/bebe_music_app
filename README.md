Bebe's Music App
==============
Listen to what Bebe listens to!
This is an app that displays music that I enjoy listening to

#Local Set-Up
1. create test and dev databases
   `createdb -U gschool_user song_database_test` and `createdb -U gschool_user song_database`
1. run bundler `bundle`
1. create a .env file with constants (DATABASE_TEST and DATABASE) set to the paths of your databases
   example: `DATABASE_TEST = postgres://user:password@localhost:5432/song_database_test`
1. run migrations `rake db:migrate`
1. run the tests `test`
1. run your local server `rackup`

#Heroku Set-Up
1. to migrate heroku database
  `heroku run 'sequel -m db/migrate $HEROKU_POSTGRESQL_BROWN_URL' --app better-url-shortener-staging`

#URL
http://pacific-harbor-6271.herokuapp.com/