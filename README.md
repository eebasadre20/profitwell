# NOTE: This is still unstable and incomplete. ( Work in progress )

## TODO

* User
    - [x] subscriptions
    - [x] update
    - [x] delete
* Plan
    - [x] all plans
    - [x] find plan
    - [x] create
    - [x] update
* Subscription
    - [x] create
    - [x] update
    - [x] churn
    - [x] unchurn
* Spec
    * User
        - [ ] subscriptions
        - [ ] update
        - [ ] delete
    * Plan
        - [ ] all plans
        - [ ] find plan
        - [ ] create
        - [ ] update
    * Subscription
        - [ ] create
        - [ ] update
        - [ ] churn
        - [ ] unchurn
## The Profitwell API Ruby Gem

A simple and easy to use Ruby wrapper for ProfitWell's REST API.

ProfitWell is the first business intelligence platform to bring together all of your recurring revenue business's financial, usage, and attribution data to one place that's insight laden, absolutely accurate, and 100% free.



## Installation

Add this line to your application's Gemfile:

```ruby
gem 'profitwell'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install profitwell

## Usage

```
Profitwell.config do | config |
    config.access_token = "<access_token_from_profitwell>"
end

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/eebasadre20/profitwell-ruby. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/eebasadre20/profitwell-ruby/blob/master/CODE_OF_CONDUCT.md).


## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Profitwell project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/eebasadre20/profitwell-ruby/blob/master/CODE_OF_CONDUCT.md).

## Contributing

In the spirit of [free software] (https://opensource.org/licenses/MIT ), everyone is welcome for collaboration to help improve this simple project.

- by suggesting better implementation
- by suggesting new features
- by reporting bugs
- by writing or editing documentation
- by writing specifications
- by refactoring code
- by closing issues
- by reviewing patches

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).