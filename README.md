# BetterErrors::Pry

[Better Errors](https://github.com/charliesome/better_errors) is a gem that provides a very useful error page for Ruby web/API applications.
This gem adds [Pry](http://pryrepl.org) support to Better Errors.

(This support was previously added directly to Better Errors.
This gem exists to extract Pry support from the main project.)

## Installation

Add this to your application's Gemfile, in the same group as better_errors:

```ruby
group :development do
  gem 'better_errors'
  gem 'binding_of_caller'
  gem 'better_errors-pry'
end
```

**It's important to keep this in the development group.**
See [Better Errors](https://github.com/charliesome/better_errors) for more information.

[`binding_of_caller`](https://github.com/banister/binding_of_caller) is required by this gem, since it's necessary to be able to run Pry in the context of the exception that was raised.

And then execute:

    $ bundle

## Usage

See [Better Errors](https://github.com/charliesome/better_errors#usage) for more information.

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

