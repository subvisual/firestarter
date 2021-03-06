# -*- encoding: utf-8 -*-
$LOAD_PATH.push File.expand_path("../lib", __FILE__)
require "firestarter/version"
require "date"

Gem::Specification.new do |s|
  s.name = "gb-firestarter"
  s.version = Firestarter::VERSION
  s.summary = "Generate a Rails app using groupbuddies's best practices and opinions."
  s.description = <<-HERE
Firestarter is the way to get great apps up and running in a heartbeat. It's
what we use at Subvisual.
  HERE
  s.authors = ["Subvisual"]
  s.email = "contact@subvisual.co"

  s.files = `git ls-files`.split("\n")
  s.executables = ["firestarter"]
  s.homepage = "http://github.com/groupbuddies/firestarter"
  s.extra_rdoc_files = %w(README.md LICENSE)
  s.license = "MIT"

  s.executables = ["firestarter"]
  s.rdoc_options = ["--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.test_files = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.required_ruby_version = ">= 1.9.2"
  s.date = Date.today.strftime("%Y-%m-%d")

  s.add_dependency "bundler", "~> 1.3"
  s.add_dependency "rails", Firestarter::RAILS_VERSION

  s.add_development_dependency "aruba", "~> 0.14.2"
  s.add_development_dependency "rspec", "~> 3.0"
  s.add_development_dependency "capybara", "~> 2.2", ">= 2.2.0"
  s.add_development_dependency "rubocop", "~> 0.40.0"
end
