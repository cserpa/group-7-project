![Build Status](https://codeship.com/projects/6a053520-6ba7-0134-8a4f-6efe74dd2a57/status?branch=master)
![Code Climate](https://codeclimate.com/github/cserpa/group-7-project.png)
![Coverage Status](https://coveralls.io/repos/cserpa/group-7-project/badge.png)

# README
Authors:
Cameron Cogan
Zachary Cutler
Myles Olson
Chris Serpa


* Ruby version: 2.3.1

* System dependencies:
  - brew install imagemagick
  - brew install phantomjs
  - brew install npm
  - gem install bundler
  - bundle
  - npm install

* To run the app locally:
  - use two terminal windows
  - in one, run: rails s
  - in the other, run: npm start
  - visit localhost:3000

* Configuration
  - you will need S3 keys in .env file with secrets from Amazon S3 account to use profile picture features.
  - review Fog and Carrierwave documentation if needed.

* Database creation
  - rake db:create && rake db:migrate to set up tables

* Databse initialization
  - rails db:seed to seed the database

* How to run the test suite
  - run test suite with rake

# Figurate
This is an app for rating historical figures, intended for entertainment purposes.
Users can create historical figures and then rate them, as well as rating the figures
other people create. Each figure has an aggregate rating. The index page keeps track
of the highest and lowest rated figures. You can also upvote or downvote someone's review.

# How To Use
Sign up and then bash your favorite hisotrical figures, or give props to the deserving.


Link to Heroku App:
https://figur8te.herokuapp.com/
