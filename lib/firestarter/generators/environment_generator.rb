require "rails/generators"
require "firestarter/generators/environment/test_generator"
require "firestarter/generators/environment/development_generator"
require "firestarter/generators/environment/production_generator"
require "firestarter/generators/environment/staging_generator"

module Firestarter
  class EnvironmentGenerator < Rails::Generators::Base
    # def development
    #   require 'pry'; binding.pry
    #   generate "firestarter:environment:development"
    # end

    # def production
    #   generate "firestarter:environment:production"
    # end

    def staging
      generate "firestarter:environment:staging"
    end

    # def setup_test_environment
    #   generate "firestarter:environment:development"
    # end
  end
end
