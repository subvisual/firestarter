# Firestarter [![Build Status](https://travis-ci.org/groupbuddies/firestarter.svg?branch=master)](https://travis-ci.org/groupbuddies/firestarter)

Firestarter is the base Rails application used at [Group Buddies](http://groupbuddies.com).

Installation
------------

First install the firestarter gem:

    gem install gb-firestarter

Then run:

    firestarter projectname

This will create a Rails 4.0 app in `projectname`.

By default this script creates a new git repository. See below if you
want to use it against an existing repo.

Gemfile
-------

To see the latest and greatest gems, look at Firstarter's
[Gemfile](templates/Gemfile.erb),
which will be appended to the default generated projectname/Gemfile.

It includes application gems like:

* [Bourbon](https://github.com/thoughtbot/bourbon) for Sass mixins
* [Email Validator](https://github.com/balexand/email_validator) for email
  validation
* [jQuery Rails](https://github.com/rails/jquery-rails) for jQuery
* [Postgres](https://github.com/ged/ruby-pg) for access to the Postgres database
* [Rack Timeout](https://github.com/kch/rack-timeout) to abort requests that are
  taking too long
* [Recipient Interceptor](https://github.com/croaky/recipient_interceptor) to
  avoid accidentally sending emails to real people from staging
* [Simple Form](https://github.com/plataformatec/simple_form) for form markup
  and style
* [Unicorn](https://github.com/defunkt/unicorn) to serve HTTP requests
* [Title](https://github.com/calebthompson/title) for storing titles in
  translations

And gems only for staging and production like:

* [New Relic RPM](https://github.com/newrelic/rpm) for monitoring performance
* [Rails 12 Factor](https://github.com/heroku/rails_12factor) to make running
  Rails 4 apps easier on Heroku

And development gems like:

* [Dotenv](https://github.com/bkeepers/dotenv) for loading environment variables
* [Pry Rails](https://github.com/rweng/pry-rails) for debugging
* [Spring](https://github.com/rails/spring) for fast Rails actions via
  pre-loading

And testing gems like:

* [Capybara](https://github.com/jnicklas/capybara) and
  [Capybara Webkit](https://github.com/thoughtbot/capybara-webkit) for
  integration testing
* [Factory Girl](https://github.com/thoughtbot/factory_girl) for test data
* [RSpec](https://github.com/rspec/rspec) for unit testing
* [RSpec Mocks](https://github.com/rspec/rspec-mocks) for stubbing and spying
* [Shoulda Matchers](https://github.com/thoughtbot/shoulda-matchers) for common
  RSpec matchers
* [Timecop](https://github.com/jtrupiano/timecop-console) for testing time

Other goodies
-------------

Firestarter also comes with:

* The [`./bin/setup`][bin] convention for new developer setup
* Rails' flashes set up and in application layout
* A few nice time formats set up for localization
* `Rack::Deflater` to [compress responses with Gzip][compress]
* [Fast-failing factories][fast]
* A [low database connection pool limit][pool]
* [Safe binstubs][binstub]
* [t() and l() in specs without prefixing with I18n][i18n]

[bin]: http://robots.thoughtbot.com/bin-setup
[compress]: http://robots.thoughtbot.com/content-compression-with-rack-deflater/
[fast]: http://robots.thoughtbot.com/testing-your-factories-first
[pool]: https://devcenter.heroku.com/articles/concurrency-and-database-connections
[binstub]: https://github.com/thoughtbot/suspenders/pull/282
[i18n]: https://github.com/thoughtbot/suspenders/pull/304

Firestarter fixes several of Rails' [insecure defaults]:

* Firestarter uses Unicorn instead of WEBrick, allowing less verbose Server
  headers.
* Firestarter is configured to pull your application secret key base from an
  environment variable, which means you won't need to risk placing it in version
  control.

[insecure defaults]: http://blog.codeclimate.com/blog/2013/03/27/rails-insecure-defaults/

Heroku
------

You can optionally create Heroku staging and production apps:

    firestarter app --heroku true

This:

* Creates a staging and production Heroku app
* Sets them as `staging` and `production` Git remotes
* Configures staging with `RACK_ENV` and `RAILS_ENV` environment variables set
  to `staging`

Git
---

This will initialize a new git repository for your Rails app. You can
bypass this with the `--skip-git` option:

    firestarter app --skip-git true

GitHub
------

You can optionally create a GitHub repository for the new Rails app. It
requires that you have [Hub](https://github.com/github/hub) on your system:

    curl http://hub.github.com/standalone -sLo ~/bin/hub && chmod +x ~/bin/hub
    firestarter app --github organization/project

This has the same effect as running:

    hub create organization/project

Dependencies
------------

Firestarter requires Ruby 1.9.2 or greater.

Some gems included in Firestarter have native extensions. You should have GCC
installed on your machine before generating an app with Firestarter.

Use [OS X GCC Installer](https://github.com/kennethreitz/osx-gcc-installer/) for
Snow Leopard (OS X 10.6).

Use [Command Line Tools for XCode](https://developer.apple.com/downloads/index.action)
for Lion (OS X 10.7) or Mountain Lion (OS X 10.8).

We use [Capybara Webkit](https://github.com/thoughtbot/capybara-webkit) for
full-stack Javascript integration testing. It requires QT. Instructions for
installing QT are
[here](https://github.com/thoughtbot/capybara-webkit/wiki/Installing-Qt-and-compiling-capybara-webkit).

PostgreSQL needs to be installed and running for the `db:create` rake task. See
[Postgres.app](http://postgresapp.com/) for Mac OS.

Issues
------

If you have problems, please create a
[Github Issue](https://github.com/groupbuddies/firestarter/issues).

Contributing
------------

Please see CONTRIBUTING.md for details.

Credits
-------

Firestarter is largely inspired by thoughtbot's suspenders, so thank you
thoughtbot.

![groupbuddies](http://www.groupbuddies.com/logo.png)

Firestarter is maintained by
[Group Buddies](http://groupbuddies.com/).

License
-------

Firestarter is © 2014 GB-Software As A Service, Lda. It is free software and may be
redistributed under the terms specified in the [LICENSE](LICENSE) file.
