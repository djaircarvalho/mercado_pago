![Gem](https://img.shields.io/gem/v/mercado_pago.svg) [![Build Status](https://travis-ci.org/djaircarvalho/mercado_pago.svg?branch=master)](https://travis-ci.org/djaircarvalho/mercado_pago) [![Maintainability](https://api.codeclimate.com/v1/badges/2d65728da985b0de17f8/maintainability)](https://codeclimate.com/github/djaircarvalho/mercado_pago/maintainability) [![Test Coverage](https://api.codeclimate.com/v1/badges/2d65728da985b0de17f8/test_coverage)](https://codeclimate.com/github/djaircarvalho/mercado_pago/test_coverage)
# MercadoPago

This gem follows the [Mercado Pago's](https://www.mercadopago.com.br/developers/pt/guides/marketplace/advanced-payments/introduction/) specification for advanced payments(split payment).

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'mercado_pago'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install mercado_pago


## Configuration
The gem will altomatically look for `ENV['RACK_ENV']` or `ENV['RAILS_ENV']` ENV vars

You must create a config file:
``` ssh
    touch config/mercado_pago.yml
```

with the following structure:

``` yml
    production:
      access_token: access_token_production
      application_id: application_id_production
    test:
      access_token: access_token_test
      application_id: application_id_test

```

for a different file path just use:
``` ruby
    MercadoPago.configure do |config|
        config.config_file_path = 'path/to/config.yml'
    end
```

## Usage

   Please look at the spec folder for the test examples. They are self-explanatory

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/mercado_pago. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the MercadoPago project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/mercado_pago/blob/master/CODE_OF_CONDUCT.md).
