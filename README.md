# Liquick_cleany

Website to preduce `Housekeeping` service when you're away from home.

## Enviroment:

* Ruby version: `2.6.3`

## Run introduction
* install required gem: `bundle install`
* install required package: `npm install`
* add env variale to send mail: 
  - open config file : `nano ~/.bashrc` or `nano ~/.zshrc`
  - add env variale : 
    + `export GMAIL_USERNAME="xxx@gmail.com"` 
    + `export GMAIL_PASSWORD="xxxxxx"`
  - save config file
* create database: `rake db:drop db:create db:migrate db:seed`
* start server:  `rails s`
* Open web: `localhost:3000`

## Routes
* Home page: `localhost:3000/`
* User: `localhost:3000/signin`
* Admin: `localhost:3000/admin/login`
