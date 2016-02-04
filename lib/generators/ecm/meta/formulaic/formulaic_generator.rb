module Ecm::Meta
  module Generators
    class FormulaicGenerator < Rails::Generators::Base
      desc 'Installs Formulaic'

      source_root File.expand_path('../templates', __FILE__)

      def add_to_application_gemfile
        append_file 'Gemfile.application', "\ngem 'formulaic', group: :test"
        %x(bundle install)

        template 'support.rb', 'spec/support/formulaic.rb'
      end
    end
  end
end
