# ZIP homepage opensource project

This is the home of [ZIP](http://zipzg.com) - the best startup incubator in the world! It is an open source project created by our awesome community! Check it out! :)

## Getting started

This project is riding Ruby on Rails. To start contributing you should have installed:

* [Ruby programming language](http://www.ruby-lang.org/en/) - version 1.9.3-p125 or higher (not tested with ruby2.0)
* [RVM](https://rvm.io/) - Ruby Version Manager
* [Git](http://git-scm.com/) - for version control
* [Rubygems](http://rubygems.org/) - for all those precious gems
* [Rails](http://rubyonrails.org/) - this project is tested using version Rails 3.2.13

## Contributing

So, you finally realised the awesomeness scope of ZIP and are now ready to contribute. Bless you. Just keep the following in mind:

* Contributions will not be accepted without tests. Please stay in the confines of the current test suite and use Rspec
* Please follow the Github Ruby Styleguide when modifying Ruby code.

## Test dependencies

To run the test suite you'll need to install dependencies. ZIP-home uses Bundler, so a quick run of the bundle command and you're all set!

    $ bundle

Before you start, run the tests and make sure that they pass (to confirm your environment is configured properly):

    $ rspec

## Workflow

Here's the most direct way to get your work merged into the project:

* Fork the project.
* Clone down your fork ( git clone git://github.com/<username>/zip-home.git ).
* Create a topic branch to contain your change ( git checkout -b my_awesome_feature ).
* Add tests and hack away, add tests.
* Make sure everything still passes by running rspec.
* If necessary, rebase your commits into logical chunks, without errors.
* Push the branch up ( git push origin my_awesome_feature ).
* Create a pull request against ofcan/zip-home and describe what your change does and the why you think it should be merged.

## In the end...

... hacking on ZIP-home should be fun. If you find any of this hard to figure out, let us know so we can improve our process or documentation! Thanks!
