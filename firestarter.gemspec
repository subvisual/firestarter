# -*- encoding: utf-8 -*-
$:.push File.expand_path('../lib', __FILE__)
require 'firestarter/version'
require 'date'

Gem::Specification.new do |s|
  s.name = 'gb-firestarter'
  s.version = Firestarter::VERSION
  s.summary = "Generate a Rails app using groupbuddies's best practices and opinions."
  s.description = <<-HERE
Firestarter is the way to get great apps up and running in a heartbeat. It's
what we use at Group Buddies.
  HERE
  s.authors = ['groupbuddies']
  s.email = 'contact@groupbuddies.com'

  s.files = `git ls-files`.split("\n")
  s.executables = ['firestarter']
  s.homepage = 'http://github.com/groupbuddies/firestarter'
  s.extra_rdoc_files = %w[README.md LICENSE]
  s.license = 'MIT'

  s.executables = ['firestarter']
  s.rdoc_options = ['--charset=UTF-8']
  s.require_paths = ['lib']
  s.test_files = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.required_ruby_version = '>= 1.9.2'
  s.date = Date.today.strftime('%Y-%m-%d')

  s.add_dependency 'bundler', '~> 1.3'
  s.add_dependency 'rails', Firestarter::RAILS_VERSION

  s.add_development_dependency 'aruba', '~> 0.5.4'
  s.add_development_dependency 'rspec', '~> 2.0'
  s.add_development_dependency 'capybara', '~> 2.2', '>= 2.2.0'
end
