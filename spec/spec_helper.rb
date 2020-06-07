require "bundler/setup"
require "profitwell"
require "webmock/rspec"
require "pry"

RSpec.configure do |config|
  # Enable flags like --only-failures and --next-failure
  config.example_status_persistence_file_path = ".rspec_status"
  config.filter_run focus: true
  config.run_all_when_everything_filtered = true
  # Disable RSpec exposing methods globally on `Module` and `main`
  config.disable_monkey_patching!
  config.include WebMock::API

 # WebMock.allow_net_connect!

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end

  config.before(:context) do
    Profitwell.config do | config |
      config.access_token = "sample_token" # "586dd793c3acf429018c3369f04fb38a"
    end
  end
end

def fixture_path
  File.expand_path("../fixtures", __FILE__)
end

def fixture(file)
  File.read(fixture_path + '/' + file)
end