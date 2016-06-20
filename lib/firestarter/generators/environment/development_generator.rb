require "rails/generators"

module Firestarter
  class DevelopmentEnvironmentGenerator < Rails::Generators::Base
    source_root File.expand_path(
      File.join("..", "..", "..", "templates"),
      File.dirname(__FILE__))

    def raise_on_delivery_errors
      replace_in_file "config/environments/development.rb",
        "raise_delivery_errors = false", "raise_delivery_errors = true"
    end

    def raise_on_unpermitted_parameters
      action_on_unpermitted_parameters = <<-RUBY

  # Raise an ActionController::UnpermittedParameters exception when
  # a parameter is not explcitly permitted but is passed anyway.
  config.action_controller.action_on_unpermitted_parameters = :raise
      RUBY
      inject_into_file(
        "config/environments/development.rb",
        action_on_unpermitted_parameters,
        before: "\nend",
      )
    end

    def provide_setup_script
      remove_file "bin/setup"
      copy_file "bin_setup", "bin/setup"
      run "chmod a+x bin/setup"
    end

    def provide_dev_prime_task
      copy_file "development_seeds.rb", "lib/tasks/development_seeds.rake"
    end

    def configure_generators # rubocop:disable Metrics/MethodLength
      config = <<-RUBY
    config.generators do |generate|
      generate.helper false
      generate.javascript_engine false
      generate.request_specs false
      generate.routing_specs false
      generate.stylesheets false
      generate.test_framework :rspec
      generate.view_specs false
    end

      RUBY

      inject_into_class "config/application.rb", "Application", config
    end
  end
end
