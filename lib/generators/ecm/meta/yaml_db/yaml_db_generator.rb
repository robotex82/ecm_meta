module Ecm::Meta
  module Generators
    class YamlDbGenerator < Rails::Generators::Base
      desc 'Installs Guard Yaml DB'

      def add_to_application_gemfile
        append_file 'Gemfile.application', "\ngem 'yaml_db', group: :development"
        %x(bundle install)
      end
    end
  end
end
