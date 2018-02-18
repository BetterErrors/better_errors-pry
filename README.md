[![Gem Version](https://img.shields.io/gem/v/better_errors-pry.svg)](https://rubygems.org/gems/better_errors-pry)
[![Build Status](https://travis-ci.org/RobinDaugherty/better_errors-pry.svg?branch=master)](https://travis-ci.org/RobinDaugherty/better_errors-pry)
[![Codacy Badge](https://api.codacy.com/project/badge/Grade/6140d26c9789476f84cc3963631e7860)](https://www.codacy.com/app/robindaugherty/better_errors-pry?utm_source=github.com&amp;utm_medium=referral&amp;utm_content=RobinDaugherty/better_errors-pry&amp;utm_campaign=Badge_Grade)

# BetterErrors::Pry

[Better Errors](https://github.com/charliesome/better_errors) is a gem that provides a very useful error page for Ruby web/API applications.
This gem adds [Pry](http://pryrepl.org) support to Better Errors.

_This gem is intended to allow us to extract Pry support from the BetterErrors project itself.
Through at least v2.4.0, Pry support is included in the project directly.
Including this gem will replace the built-in support, and it is functionally the same at this time._

## Why the separate gem for Pry support?

BetterErrors supports a very large number of possible configurations.
It supports Rails and non-Rails, with binding_of_caller and without, and all of the major versions of the Ruby interpreter.

All of these combinations should be tested.
Currently BetterErrors has 14 different test gemfiles, each running on 6 different versions of Ruby.
And these are not comprehensive.

Because the BetterErrors gem needs to support each of these configurations, it can't specify any of its optional dependencies' required versions.
This makes BetterErrors difficult to maintain, and difficult for application maintainers to keep it and its dependencies up-to-date.

(For example, for several years, the newer version of `binding_of_caller` did not work correctly, so applications that used BetterErrors were given instructions to lock `binding_of_caller` to a specific version.
This is because BetterErrors could not specify the `binding_of_caller` version in its own gemspec, since it is optional.
Once the issue was fixed, application maintainers had no way to know that it was possible to remove the fixed version.)

The solution is to extract optional functionality that depends on additional gems from the BetterErrors project, and place it in a project like this one.

## Installation

Add this to your application's `Gemfile`, in the `development` group, just like better_errors:

```ruby
group :development do
  gem 'better_errors'
  gem 'better_errors-pry'
end
```

You need to activate pry in the application (for example, in `config/environments/development.rb`):

```ruby
BetterErrors.use_pry!
```

**It's important to keep this in the development group.**
See [Better Errors](https://github.com/charliesome/better_errors#security) for more information.

## Usage

See [Better Errors](https://github.com/charliesome/better_errors#usage) to get started.

When you see the Better Errors console, you can issue Pry-specific commands, such as `ls` and `cd`.

## Development

After checking out the repo, run `bundle install` to install the basic dependencies.

You can run the tests with the most recent versions of Pry and Better Errors by running `bundle exec rake`.

To run the tests against the other sets of dependencies, though, you will need to use Appraisal.
Run `appraisal install` to run install the dependencies for each of the possible combinations.

Then you can run `appraisal rake` to run all tests, or `appraisal pry_0.09 rake` (for example) to only run the specs with Pry 0.09.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

On CI, the specs are run against each major release of Ruby in addition to each Appraisal gemfile.

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
