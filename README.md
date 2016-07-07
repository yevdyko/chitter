# Chitter

[![Build Status](https://travis-ci.org/yevdyko/chitter.svg?branch=master)](https://travis-ci.org/yevdyko/chitter)  [![Coverage Status](https://coveralls.io/repos/github/yevdyko/chitter/badge.svg?branch=master)](https://coveralls.io/github/yevdyko/chitter?branch=master)  [![Code Climate](https://codeclimate.com/github/yevdyko/chitter/badges/gpa.svg)](https://codeclimate.com/github/yevdyko/chitter)

An application that allows users to post messages to a public stream. The basic requirements were that users should be able to sign up for a new account, log in or out, and post new tweets.

## Technologies used

- Ruby using Sinatra
- PostgreSQL database using DataMapper ORM
- Bcrypt for secure the passwords
- HAML as a templating engine for HTML
- Travis CI for continious intergration
- Time-lord gem for time expressions
- Tested with RSpec, Capybara, FactoryGirl and Timecop

## User Stories

```
As a Maker
So that I can post messages on Chitter as me
I want to sign up for Chitter

As a Maker
So that I can post messages on Chitter as me
I want to log in to Chitter

As a Maker
So that I can avoid others posting messages on Chitter as me
I want to log out of Chitter

As a Maker
So that I can let people know what I am doing
I want to post a message (peep) to chitter

As a maker
So that I can see what others are saying
I want to see all peeps in reverse chronological order

As a maker
So that I can better appreciate the context of a peep
I want to see the time at which it was made
```

## Notes on functionality:

* The username and email are unique.
* Peeps (posts to Chitter) have the name of the maker and their user handle.
* You have to be logged in to see the peeps.
* You only can peep if you are logged in.
* In order to start a conversation as a maker I want to reply to a peep from another maker.

## Setup

Clone the repository:

    $ git clone git@github.com:yevdyko/chitter-challenge.git

Change into the directory:

    $ cd chitter-challenge

If you don't have bundle already, run the command:

    $ gem install bundle

Install all dependencies with:

    $ bundle

Create a development database:

    $ createdb chitter_development

Setup the database using the rake task:

    $ rake db:auto_migrate

Launch the app:

    $ rackup

Go to your browser and open [http://localhost:9292](http://localhost:9292)

## Testing

Create a test database:

    $ createdb chitter_test

Setup the test database using the rake task:

    $ rake db:auto_migrate RACK_ENV=test

To run the tests:

    $ rspec

## Screenshots
