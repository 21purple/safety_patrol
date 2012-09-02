$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'rspec'
require 'safety_patrol'

SafetyPatrol.configure

RSpec.configure do |config|
  config.mock_with :rspec
end