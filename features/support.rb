require 'simplecov'
SimpleCov.start

require 'aruba/cucumber'

Before do
  @aruba_timeout_seconds = 10
end
