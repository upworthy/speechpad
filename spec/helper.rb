unless ENV['CI']
  require 'simplecov'
  SimpleCov.start do
    add_filter 'spec'
  end
end
require 'speechpad'
require 'rspec'
require 'timecop'
require 'webmock/rspec'

RSpec.configure do |config|
  config.before(:all) do
    Timecop.freeze(Time.local(2014))
  end
end
