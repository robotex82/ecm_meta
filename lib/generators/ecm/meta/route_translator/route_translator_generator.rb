module Ecm::Meta
  module Generators
    class RouteTranslatorGenerator < Rails::Generators::Base
      desc 'Installs Route Translator'

      source_root File.expand_path('../templates', __FILE__)

      def add_to_application_gemfile
        append_file 'Gemfile.application', "\ngem 'route_translator'"
      end

      def bundle
        %x(bundle install)
      end

      def generate_initializer
        template 'initializer.rb', 'config/initializers/route_translator.rb'
      end

      def configure
        if yes? "Do you want to force locale? force_locale Set this options to true to force the locale to be added to all generated route paths, even for the default locale. Defaults to false."
          inject_into_file 'config/initializers/route_translator.rb', before: "\nend" do
            "\n  config.force_locale = true"
          end          
        end
      end
    end
  end
end
