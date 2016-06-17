if %w(development test).include? Rails.env
  require "rubocop/rake_task"
  require "scss_lint"
  require "scss_lint/rake_task"

  namespace :lint do
    desc "Run all linters"
    task all: %i(rubocop scss_lint)

    RuboCop::RakeTask.new

    SCSSLint::RakeTask.new do |task|
      task.config = ".scss-lint.yml"
    end
  end
end
