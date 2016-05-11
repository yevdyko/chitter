Chitter Challenge
=================

[![Build Status](https://travis-ci.org/yevdyko/chitter-challenge.svg?branch=master)](https://travis-ci.org/yevdyko/chitter-challenge)  [![Coverage Status](https://coveralls.io/repos/github/yevdyko/chitter-challenge/badge.svg?branch=master)](https://coveralls.io/github/yevdyko/chitter-challenge?branch=master)  [![Code Climate](https://codeclimate.com/github/yevdyko/chitter-challenge/badges/gpa.svg)](https://codeclimate.com/github/yevdyko/chitter-challenge)

We are going to write a little Twitter clone that will allow the users to post messages to a public stream.

Features:
---------

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

Notes on functionality:
-----------------------

* Drive the creation of your app using tests - either cucumber or rspec as you prefer
* Makers sign up to chitter with their email, password, name and a user name (e.g. sam@makersacademy.com, s3cr3t, Samuel Russell Hampden Joseph, tansaku).
* The username and email are unique.
* Peeps (posts to chitter) have the name of the maker and their user handle.
* Use bcrypt to secure the passwords.
* Use data mapper and postgres to save the data.
* You don't have to be logged in to see the peeps.
* You only can peep if you are logged in.

Bonus:
------

If you have time you can implement the following:

* In order to start a conversation as a maker I want to reply to a peep from another maker.

And/Or:

* Work on the css to make it look good (we all like beautiful things).

Installation
------------

1. Clone this repo
2. Run the command `gem install bundle` (if you don't have bundle already)
3. When the installation completes, run `bundle`

Running tests
-------------

To run the tests use the command `rspec`

