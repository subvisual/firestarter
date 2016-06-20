require "rails/generators"

module Firestarter
  class TestEnvironmentGenerator < Rails::Generators::Base
    source_root File.expand_path(
      File.join("..", "..", "..", "templates"),
      File.dirname(__FILE__))

    def enable_factory_girl_syntax
      require 'pry'; binding.pry
      copy_file "factory_girl_syntax_rspec.rb", "spec/support/factory_girl.rb"
    end

    def test_factories_first
      copy_file "factories_spec.rb", "spec/models/factories_spec.rb"
      append_file "Rakefile", factories_spec_rake_task
    end

    def generate_rspec
      generate "rspec:install"
    end

    def configure_rspec
      remove_file "spec/spec_helper.rb"
      copy_file "spec_helper.rb", "spec/spec_helper.rb"
    end

    def enable_database_cleaner
      copy_file "database_cleaner_rspec.rb", "spec/support/database_cleaner.rb"
    end

    def configure_spec_support_features
      empty_directory_with_keep_file "spec/features"
      empty_directory_with_keep_file "spec/support/features"
    end

    def configure_i18n_in_specs
      copy_file "i18n.rb", "spec/support/i18n.rb"
    end
  end
end
