require 'simplecov'
SimpleCov.start
require 'simplecov-console'
SimpleCov.formatter = SimpleCov::Formatter::Console
require 'json'
require 'bundler/setup'
require 'mercado_pago'
require 'support/vcr_setup'
require 'webmock/rspec'

WebMock.disable_net_connect!(allow_localhost: true)

RSpec.configure do |config|
  # Enable flags like --only-failures and --next-failure
  config.example_status_persistence_file_path = '.rspec_status'

  # Disable RSpec exposing methods globally on `Module` and `main`
  config.disable_monkey_patching!

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end
end
