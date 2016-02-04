module Ecm::Meta
  module Generators
    class GuardBundlerGenerator < Rails::Generators::Base
      desc 'Installs Guard Bundler'

      def add_to_application_gemfile
        append_file 'Gemfile.application', "\ngem 'guard-bundler', group: :development"
        %x(bundle install)
        %x(guard init)
        gsub_file 'Guardfile', /files = \['Gemfile'\]/, "files = ['Gemfile', 'Gemfile.application']"
      end
    end
  end
end
