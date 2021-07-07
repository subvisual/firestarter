[subvisual]: http://subvisual.co/
[build-page]: https://travis-ci.org/subvisual/firestarter
[code-climate]: https://codeclimate.com/github/subvisual/firestarter

Firestarter
===========

[![Build Status](https://travis-ci.org/subvisual/firestarter.svg?branch=master)][build-page]
[![Code Climate](https://codeclimate.com/github/subvisual/firestarter/badges/gpa.svg)][code-climate]

Firestarter is the Rails application generator used at [Subvisual][subvisual].

**Table of Contents**

* [Installation](#installation)
* [Gemfile](#gemfile)
* [Other goodies](#other-goodies)
* [Git](#git)
* [Dependencies](#dependencies)
* [Issues](#issues)
* [Contributing](#contributing)
* [Credits](#credits)
* [License](#license)

Installation
------------

First install the Firestarter gem:

    gem install gb-firestarter

Then run:

    firestarter <project_name>

This will create a new Rails application in `./<project_name>`. By default,
Firestarter will use Rails 4.2.0 to generate new applications. You can override
this by setting the `RAILS_VERSION` environment variable when running the
generator:

    RAILS_VERSION=4.1.16 firestarter <project_name>


By default this script creates a new git repository. See below if you want to
use it against an existing one.

Gemfile
-------

To see the latest and greatest gems, look at Firestarter's template
[Gemfile](templates/Gemfile.erb), which will be appended to the default
generated `<project_name>/Gemfile`.

It includes application gems like:

* [dotenv](https://github.com/bkeepers/dotenv) for loading environment variables
  from a file;
* [jQuery Rails](https://github.com/rails/jquery-rails) for jQuery;
* [Postgres](https://github.com/ged/ruby-pg) for access to the Postgres
  database;
* [Pry Rails](https://github.com/rweng/pry-rails) for performing console
  operations;
* [Puma](https://github.com/puma/puma) to serve HTTP requests.

And gems only for staging and production like:

* [Rack Timeout](https://github.com/kch/rack-timeout) to abort requests that are
  taking too long;
* [Rails 12 Factor](https://github.com/heroku/rails_12factor) to make running
  Rails applications easier on Heroku.

And development gems like:

* [Better Errors](https://github.com/charliesome/better_errors) for debugging.

And testing gems like:

* [Capybara](https://github.com/jnicklas/capybara) and
  [Capybara Webkit](https://github.com/thoughtbot/capybara-webkit) for
  integration testing;
* [Factory Girl](https://github.com/thoughtbot/factory_girl) for generating test
  data (and seeds);
* [RSpec](https://github.com/rspec/rspec) for unit testing;
* [Timecop](https://github.com/jtrupiano/timecop-console) for testing time.

Other goodies
-------------

Firestarter also includes:

* The [`./bin/setup`][bin] convention for new developer setup;
* Rails' flashes set up and in application layout;
* A few nice time formats set up for localization;
* `Rack::Deflater` to [compress responses with Gzip][compress];
* [Fast-failing factories][fast];
* [A low database connection pool limit][pool];
* [Safe binstubs][binstub];
* [`t()` and `l()` in specs without prefixing with `I18n`][i18n].

[bin]: http://robots.thoughtbot.com/bin-setup
[compress]: http://robots.thoughtbot.com/content-compression-with-rack-deflater/
[fast]: http://robots.thoughtbot.com/testing-your-factories-first
[pool]: https://devcenter.heroku.com/articles/concurrency-and-database-connections
[binstub]: https://github.com/thoughtbot/suspenders/pull/282
[i18n]: https://github.com/thoughtbot/suspenders/pull/304

Firestarter fixes several of Rails' [insecure defaults]:

* Firestarter uses Puma instead of WEBrick, allowing less verbose Server
  headers;
* Firestarter is configured to pull your application secret key base from an
  environment variable, which means you won't need to risk placing it in version
  control.

[insecure defaults]: http://blog.codeclimate.com/blog/2013/03/27/rails-insecure-defaults/

Git
---

This will initialize a new git repository for your Rails application. You can
bypass this with the `--skip-git` option:

    firestarter <project_name> --skip-git true

Dependencies
------------

Firestarter requires Ruby 2.1.0 or greater. The generated project will be set to
use Ruby 2.3.1 by default.

Some gems included in Firestarter have native extensions. You should have GCC
installed on your machine before generating an application with Firestarter.

Use the [OS X GCC Installer](https://github.com/kennethreitz/osx-gcc-installer/) for
Snow Leopard (OS X 10.6).

Use [Command Line Tools for XCode](https://developer.apple.com/downloads/index.action)
for Lion (OS X 10.7) or posterior.

We use [Capybara Webkit](https://github.com/thoughtbot/capybara-webkit) for
full-stack Javascript integration testing. It requires Qt. Instructions for
installing Qt are [here][installing-qt]. **WARNING**: Qt 5.6 dropped the Qt
WebKit module, in favor of the new Qt WebEngine module. As such, the installed
version of Qt must be <= 5.5.

[installing-qt]: https://github.com/thoughtbot/capybara-webkit/wiki/Installing-Qt-and-compiling-capybara-webkit

PostgreSQL needs to be installed and running for the `db:create` rake task. For
OS X you can install it through [Homebrew](http://brew.sh/) or by installing the
[Postgres application][postgres-app].

[postgres-app]: http://postgresapp.com/

Issues
------

If you have any problems with this project, please create a
[Github Issue](https://github.com/subvisual/firestarter/issues).

Contributing
------------

Please see [CONTRIBUTING](CONTRIBUTING.md) for details.

Credits
-------

Firestarter is maintained by [Subvisual][subvisual].

[![Subvisual](https://raw.githubusercontent.com/subvisual/guides/master/github/templates/subvisual_logo_with_name.png)][subvisual]

Firestarter is largely inspired by [thoughtbot's suspenders][suspenders], so
thank you thoughtbot.

[suspenders]: https://github.com/thoughtbot/suspenders

License
-------

Firestarter is Copyright © 2014-2017 Subvisual. It is free
software and may be redistributed under the terms specified in the
[LICENSE](LICENSE) file.
