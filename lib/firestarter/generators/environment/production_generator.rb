require "rails/generators"

module Firestarter
  class ProductionEnvironmentGenerator < Rails::Generators::Base
    source_root File.expand_path(
      File.join("..", "..", "..", "templates"),
      File.dirname(__FILE__))
  end
end
