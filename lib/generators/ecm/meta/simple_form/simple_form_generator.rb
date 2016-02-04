module Ecm::Meta
  module Generators
    class SimpleFormGenerator < Rails::Generators::Base
      desc 'Installs Simple Form'

      def add_to_application_gemfile
        append_file 'Gemfile.application', "\ngem 'simple_form'"
        %x(bundle install)
        if Gem::Specification::find_all_by_name('twitter-bootstrap-rails').any?
          Rails::Generators.invoke('simple_form:install', ['--bootstrap'])
        else
          Rails::Generators.invoke('simple_form:install')
        end
      end
    end
  end
end
