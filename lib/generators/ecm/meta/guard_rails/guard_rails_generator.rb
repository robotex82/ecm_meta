module Ecm::Meta
  module Generators
    class GuardRailsGenerator < Rails::Generators::Base
      desc 'Installs Guard Rails'

      def add_to_application_gemfile
        append_file 'Gemfile.application', "\ngem 'guard-rails', group: :development"
        %x(bundle install)
        %x(guard_init)
      end

      def configure_host
        if(host = ask("Do you want to set the host (i.e. 0.0.0.0) for the rails development server?")).present?
          gsub_file 'Guardfile', /guard 'rails' do/, "guard 'rails', host: '#{host}' do"
        end
      end
    end
  end
end
