module Ecm::Meta
  module Generators
    class GuardRspecGenerator < Rails::Generators::Base
      desc 'Installs Guard Rspec'

      def add_to_application_gemfile
        append_file 'Gemfile.application', "\ngem 'guard-rspec', group: :development"
        %x(bundle install)
        %x(guard init)
      end
    end
  end
end
