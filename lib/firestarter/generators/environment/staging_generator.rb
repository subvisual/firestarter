require "rails/generators"

module Firestarter
  class StagingEnvironmentGenerator < Rails::Generators::Base
    source_root File.expand_path(
      File.join("..", "..", "..", "templates"),
      File.dirname(__FILE__))

    def hi
      puts "hi"
    end
  end
end
