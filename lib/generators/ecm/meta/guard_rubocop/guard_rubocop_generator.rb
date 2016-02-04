module Ecm::Meta
  module Generators
    class GuardRubocopGenerator < Rails::Generators::Base
      desc 'Installs Guard Rubocop'

      def add_to_application_gemfile
        append_file 'Gemfile.application', "\ngem 'guard-rubocop', group: :development"
        %x(bundle install)
        %x(guard init)
      end
    end
  end
end
