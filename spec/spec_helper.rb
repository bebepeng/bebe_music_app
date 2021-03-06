require 'sequel'
require 'dotenv'

Dotenv.load


ENV['RACK_ENV'] = 'test'

DB = Sequel.connect(ENV['TEST_DATABASE'])

RSpec.configure do |config|
  config.treat_symbols_as_metadata_keys_with_true_values = true
  config.run_all_when_everything_filtered = true
  config.filter_run :focus

  config.order = 'random'
end
