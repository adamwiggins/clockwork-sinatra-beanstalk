Sample Clockwork App (Sinatra/Beanstalk)
========================================

[Clockwork](http://github.com/adamwiggins/clockwork) is a library to replace
cron for scheduling jobs from within an application.  This is a sample
application which uses the Sinatra web framework, a MongoDB database, and the
Beanstalk queueing backend to demonstrate Clockwork's use.

The app fetches the Dow Jones index from Google Finance once every three
minutes, and puts the results in the Mongo database.  The web app shows the
history of all fetched data points.

Prerequistes
------------

* Ruby
* Bundler (gem install bundler)
* Beanstalkd (brew install beanstalk)
* MongoDB (brew install mongodb)

Setup
-----

    $ git clone git://github.com/adamwiggins/clockwork-sinatra-beanstalk.git
    $ cd clockwork-sinatra-beanstalk
    $ bundle install

Running the db and queue
------------------------

    $ mkdir -p data; mongod --dbpath data &
    $ beanstalkd &

Running the app
---------------

    $ bundle exec ruby web.rb &
    $ bundle exec stalk jobs.rb & 
    $ bundle exec clockwork clock.rb &

Alternately, use [Foreman](http://github.com/ddollar/foreman) (gem install foreman):

    $ foreman start

Visit http://localhost:4567/ and you should see the first data point.

