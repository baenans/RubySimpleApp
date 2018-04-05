# RubySimpleApp
[![Build Status](https://travis-ci.org/baenans/RubySimpleApp.svg?branch=master)](https://travis-ci.org/baenans/RubySimpleApp)
[![Maintainability](https://api.codeclimate.com/v1/badges/34f077cb277f689c4f37/maintainability)](https://codeclimate.com/github/baenans/RubySimpleApp/maintainability)
[![Test Coverage](https://api.codeclimate.com/v1/badges/34f077cb277f689c4f37/test_coverage)](https://codeclimate.com/github/baenans/RubySimpleApp/test_coverage)


This is the application for the
[*Ruby on Rails Tutorial:
Learn Web Development with Rails*](http://www.railstutorial.org/)
by [Michael Hartl](http://www.michaelhartl.com/).

## Getting started

To get started with the app, clone the repo and then install the needed gems:

```
$ bundle install --without production
```

Next, migrate the database:

```
$ rails db:migrate
```

Finally, run the test suite to verify that everything is working correctly:

```
$ rails test
```

If the test suite passes, you'll be ready to run the app in a local server:

```
$ rails server
```

For more information, see the
[*Ruby on Rails Tutorial* book](http://www.railstutorial.org/book).