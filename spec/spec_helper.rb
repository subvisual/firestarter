require "capybara/rspec"
require "bundler/setup"

Bundler.require(:default, :test)

require File.join(Pathname.new(__FILE__).dirname, "../lib/firestarter")

Dir["./spec/support/**/*.rb"].each { |file| require file }

RSpec.configure do |config|
  config.include FirestarterTestHelpers

  config.before(:all) do
    create_tmp_directory
  end

  config.before(:each) do
    drop_dummy_database
    remove_project_directory
  end
end
