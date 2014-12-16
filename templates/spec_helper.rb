require 'simplecov'
SimpleCov.start 'rails'

ENV['RAILS_ENV'] = 'test'

require File.expand_path('../../config/environment', __FILE__)

require 'rspec/rails'
require 'rspec/autorun'
require 'capybara/webkit/matchers'

Dir[Rails.root.join('spec/support/**/*.rb')].each { |file| require file }

module Features
  # Extend this module in spec/support/features/*.rb
  include Capybara::Webkit::RspecMatchers
end

RSpec.configure do |config|
  config.expect_with :rspec do |c|
    c.syntax = :expect
  end

  config.include Features, type: :feature
  config.infer_base_class_for_anonymous_controllers = false
  config.order = 'random'
  config.use_transactional_fixtures = false

  config.before(:each) do
    Capybara.current_driver = select_driver
  end
end

def select_driver
  if example.metadata[:js]
    if example.metadata[:js] == :selenium
      :selenium
    else
      :webkit
    end
  end
end
