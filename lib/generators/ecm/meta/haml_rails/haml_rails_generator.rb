module Ecm::Meta
  module Generators
    class HamlRailsGenerator < Rails::Generators::Base
      desc 'Installs Haml Rails'

      def add_to_application_gemfile
        append_file 'Gemfile.application', "\ngem 'haml-rails'"
        %x(bundle install)
      end
    end
  end
end
