require "spec_helper"

feature "Suspend a new project with default configuration" do
  before(:all) do
    drop_dummy_database
    remove_project_directory
    run_firestarter
    setup_app_dependencies
  end

  scenario "specs pass" do
    Dir.chdir(project_path) do
      Bundler.with_clean_env do
        expect(`rake`).to include("0 failures")
      end
    end
  end

  scenario "staging config is inherited from production" do
    staging_file = IO.read("#{project_path}/config/environments/staging.rb")
    config_stub = "Dummy::Application.configure do"
    expect(staging_file).to match(/^require_relative 'production'/)
    expect(staging_file).to match(/#{config_stub}/), staging_file
  end

  scenario ".ruby-version does not include patchlevel for Ruby 2.1.0+" do
    ruby_version_file = IO.read("#{project_path}/.ruby-version")
    expect(ruby_version_file).to eq "#{RUBY_VERSION}\n"
  end
end
