module Ecm::Meta
  module Generators
    class CapybaraGenerator < Rails::Generators::Base
      desc 'Installs Rspec'

      def add_to_application_gemfile
        append_file 'Gemfile.application', "\ngem 'capybara', group: :test"
        %x(bundle install)

        create_file 'spec/support/capybara.rb', "require 'capybara'"
      end
    end
  end
end
