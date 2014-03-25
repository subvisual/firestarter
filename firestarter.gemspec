# -*- encoding: utf-8 -*-
$:.push File.expand_path('../lib', __FILE__)
require 'firestarter/version'
require 'date'

Gem::Specification.new do |s|
  s.required_ruby_version = '>= 1.9.2'
  s.add_dependency 'bundler', '~> 1.3'
  s.add_dependency 'rails', '4.0.3'
  s.add_development_dependency 'aruba', '~> 0.5.2'
  s.add_development_dependency 'cucumber', '~> 1.2'
  s.authors = ['groupbuddies']
  s.date = Date.today.strftime('%Y-%m-%d')

  s.description = <<-HERE
Firestarter is the way to get great apps up and running in a heartbeat. It's
what we use at Group Buddies.
  HERE

  s.email = 'contact@groupbuddies.com'
  s.executables = ['firestarter']
  s.extra_rdoc_files = %w[README.md LICENSE]
  s.files = `git ls-files`.split("\n")
  s.homepage = 'http://github.com/groupbuddies/firestarter'
  s.license = 'MIT'
  s.name = 'gb-firestarter'
  s.rdoc_options = ['--charset=UTF-8']
  s.require_paths = ['lib']
  s.summary = "Generate a Rails app using groupbuddies's best practices and opinions."
  s.test_files = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.version = Firestarter::VERSION
  s.add_development_dependency 'rspec'
  s.add_development_dependency 'capybara'
end
