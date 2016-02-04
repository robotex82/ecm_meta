module Ecm::Meta
  module Generators
    class FactoryGirlRailsGenerator < Rails::Generators::Base
      desc 'Installs Factory Girl Rails'

      source_root File.expand_path('../templates', __FILE__)

      def add_to_application_gemfile
        append_file 'Gemfile.application', "\ngem 'factory_girl_rails', group: :test"
        %x(bundle install)
      end

      def generate_support_file
        create_file 'spec/support/factory_girl_rails.rb', "require 'factory_girl_rails'"
      end
    end
  end
end
