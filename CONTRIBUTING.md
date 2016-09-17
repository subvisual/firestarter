[subvisual]: http://subvisual.co/

# Contributing to Firestarter

**TL;DR**

1. Fork the repo;

2. Run the tests (everything should pass);

3. Add a test that fails without your code;

4. Make your test pass;

5. Push to your fork;

6. Submit a pull request;

7. Feel good about yourself, you're amazing.

---

**Table of Contents**

* [Setup](#setup)
* [Development](#development)
* [Deployment](#deployment)
* [More Sections](#more-sections)
* [Contribution Guidelines](#contribution-guidelines)
* [Resources](#resources)
* [Contacts](#contacts)

Firestarter is the Rails application generator used at [Subvisual][subvisual].

We :heart: pull requests, and no contribution is too small. If you see anything
wrong or have any suggestion we would love to hear it.

Setup
-----

To contribute to the development of Firestarter, start by cloning the repository
onto your system:

    git clone https://github.com/subvisual/firestarter.git
    cd firestarter

and install its dependencies:

    bundle install

You can verify everything is up-to-speed by running all tests:

    bundle exec rake

You now have a clean slate, ready for your changes.

Development
-----------

We only take pull requests with passing tests, so start by adding a test for
a change you want to introduce. Unless you're refactoring or working on
documentation a test is mandatory for each piece of functionality you wish to
add or fix. The tests must fail without your code.

Next, make the tests pass. Once they do, push the changes to your fork and
submit a pull request.

Pull Request
------------

At this point you're waiting on us. We try to handle pull requests within three
business days (but we usually do it in less). We may suggest some changes,
improvements or alternatives, otherwise we'll just proceed with accepting it.

Contributions must follow [Subvisual's guides][subvisual-guides]. Additionally,
here are some things that will increase the chance that your pull request gets
accepted, taken straight from the [Ruby on Rails guide][ror-guide]:

* Use Rails idioms and helpers;
* Include tests that fail without your code, and pass with it;
* Update the documentation, the surrounding one, examples elsewhere, guides,
  whatever is affected by your contribution.

[subvisual-guides]: https://github.com/subvisual/guides
[ror-guide]: http://guides.rubyonrails.org/contributing_to_ruby_on_rails.html#write-your-code

**Syntax**

For an exhaustive list of the rules, please refer to
[Subvisual's guides][subvisual-guides]. Here's a short list with the most
important:

* Use two spaces, no tabs;
* No trailing whitespaces, not even in blank lines;
* Prefer `&&`/`||` over `and`/`or`;
* Prefer parentheses, and use no spaces around their content:
  * `my_method(my_arg)` :+1:;
  * `my_method( my_arg )` :-1:;
  * `my_method my_arg` :-1:;
* Use spaces around operators:
  * `a = b` :+1:;
  * `a=b` :-1:;
* Follow the conventions you see already being used in the source.

And in case we didn't emphasize it enough: **we love tests!**
