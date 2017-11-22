# README

* **Ruby version:**

   This application require at least Ruby 2.2.2

* **System dependencies:**

   This application require *MySql*, *MySql client C lib*, *nodeJS >= 8.0.0*, *Yarn* to be compiled

* **Configuration file:**

   Configuration are stored inside config folder you have to change the database.yml (please not commit it)

* **Database creation:**

   For create the database you need to connect to mysql instance by a mysql client create a database and a user with CRUD on rows and tables privileges. The value into configuration file need to be edit

* **Database initialization:**

   For initialization of database use `rake db:migrate`

* **Test suite:**

   The project commit policy is composed of two static linter for testing quality code (`bundle exec rubocop`) and security problem (`bundle exec brakeman -z -q`). The test suite is `rspec`

* **Deployment instructions:**

   After installed all the dependency and creating the database we have to execute
   ```sh
     gem install bundler # install gem management system
     bundle install # install all the gem require
     yarn # install all the npm package require
     rails webpacker:compile # compile webpacker
     rails s # startup the server
   ```