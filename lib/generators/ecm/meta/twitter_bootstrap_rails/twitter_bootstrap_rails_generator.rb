module Ecm::Meta
  module Generators
    class TwitterBootstrapRailsGenerator < Rails::Generators::Base
      desc 'Installs Twitter Bootstrap Rails'

      def add_to_application_gemfile
        append_file 'Gemfile.application', "\ngem 'therubyracer', platforms: :ruby"
        append_file 'Gemfile.application', "\ngem 'less-rails'"
        append_file 'Gemfile.application', "\ngem 'twitter-bootstrap-rails'"
        %x(bundle install)
        Rails::Generators.invoke('bootstrap:install', ['less'])
      end

      def generate_frontend_layout
        if yes? "Do you want to generate a bootstrap frontend layout?"
          Rails::Generators.invoke('bootstrap:layout', ['frontend'])
        end
      end
    end
  end
end
