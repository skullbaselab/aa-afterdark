require_relative "../lib/tic_tac_toe.rb"

RSpec.configure do |config|
  config.mock_with :rspec do |c|
    c.syntax = [:should, :expect]
  end
end

RSpec::Expectations.configuration.warn_about_potential_false_positives = false
