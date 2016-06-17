require "rails/generators"
require "rails/generators/rails/app/app_generator"

module Firestarter
  class AppGenerator < Rails::Generators::AppGenerator # rubocop:disable Metrics/ClassLength
    class_option :database, type: :string, aliases: "-d", default: "postgresql",
      desc: "Preconfigure for selected database (options: #{DATABASES.join('/')})"

    class_option :github, type: :string, aliases: "-G", default: nil,
      desc: "Create Github repository and add remote origin pointed to repo"

    class_option :skip_test_unit, type: :boolean, aliases: "-T", default: true,
        desc: "Skip Test::Unit files"

    class_option :skip_bundle, type: :boolean, aliases: "-B", default: true,
      desc: "Don't run bundle install"

    def finish_template
      invoke :firestarter_customization
      super
    end

    def firestarter_customization # rubocop:disable Metrics/MethodLength, Metrics/AbcSize
      invoke :customize_gemfile
      invoke :bundle_install
      invoke :setup_development_environment
      invoke :setup_test_environment
      invoke :setup_production_environment
      invoke :setup_staging_environment
      invoke :setup_secret_token
      invoke :create_firestarter_views
      invoke :setup_javascript
      invoke :configure_app
      invoke :setup_stylesheets
      invoke :customize_error_pages
      invoke :remove_routes_comment_lines
      invoke :setup_git
      invoke :setup_database
      invoke :scss_lint_config
      invoke :outro
    end

    def customize_gemfile
      build :replace_gemfile
      build :set_ruby_to_version_being_used
    end

    def setup_database
      say "Setting up database"

      if "postgresql" == options[:database]
        build :use_postgres_config_template
      end

      build :create_database
    end

    def scss_lint_config
      build :scss_lint_config
    end

    def setup_development_environment
      say "Setting up the development environment"
      build :raise_on_delivery_errors
      build :raise_on_unpermitted_parameters
      build :provide_setup_script
      build :provide_dev_prime_task
      build :configure_generators
    end

    def setup_test_environment
      say "Setting up the test environment"
      build :enable_factory_girl_syntax
      build :test_factories_first
      build :generate_rspec
      build :configure_rspec
      build :enable_database_cleaner
      build :configure_spec_support_features
      build :configure_i18n_in_specs
    end

    def setup_production_environment
      say "Setting up the production environment"
      build :configure_smtp
      build :enable_rack_deflater
    end

    def setup_staging_environment
      say "Setting up the staging environment"
      build :setup_staging_environment
    end

    def setup_secret_token
      say "Moving secret token out of version control"
      build :setup_secret_token
    end

    def create_firestarter_views
      say "Creating firestarter views"
      build :create_partials_directory
      build :create_shared_flashes
      build :create_shared_javascripts
      build :create_application_layout
    end

    def setup_javascript
      say "Setting up JS defaults"
      build :remove_turbolinks
      build :remove_require_tree
      build :add_retina_tag
    end

    def configure_app # rubocop:disable Metrics/MethodLength
      say "Configuring app"
      build :configure_action_mailer
      build :configure_time_zone
      build :configure_time_formats
      build :configure_rack_timeout
      build :disable_xml_params
      build :fix_i18n_deprecation_warning
      build :setup_default_rake_task
      build :configure_puma
      build :setup_foreman
      build :use_rubocop_config
    end

    def setup_stylesheets
      say "Set up stylesheets"
      build :setup_stylesheets
    end

    def setup_git
      unless options[:skip_git]
        say "Initializing git"
        invoke :setup_gitignore
        invoke :init_git
      end
    end

    def setup_gitignore
      build :gitignore_files
    end

    def init_git
      build :init_git
    end

    def customize_error_pages
      say "Customizing the 500/404/422 pages"
      build :customize_error_pages
    end

    def remove_routes_comment_lines
      build :remove_routes_comment_lines
    end

    def bundle_install
      bundle_command "install"
    end

    def outro
      say "Congratulations! You just started a fire."
    end

    def ruby_version_with_patch_level
      "#{RUBY_VERSION}#{patch_level}"
    end

    protected

    def get_builder_class # rubocop:disable Style/AccessorMethodName
      Firestarter::AppBuilder
    end

    def using_active_record?
      !options[:skip_active_record]
    end

    def patch_level
      if RUBY_PATCHLEVEL == 0 && RUBY_VERSION >= "2.1.0"
        ""
      else
        "-p#{RUBY_PATCHLEVEL}"
      end
    end

    def spring_install?
      false
    end
  end
end
