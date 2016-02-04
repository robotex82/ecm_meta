module Ecm::Meta
  module Generators
    class ShouldaMatchersGenerator < Rails::Generators::Base
      desc 'Installs Shoulda Matchers'

      source_root File.expand_path('../templates', __FILE__)

      def add_to_application_gemfile
        append_file 'Gemfile.application', "\ngem 'shoulda-matchers', group: :test"
        %x(bundle install)

        template 'support.rb', 'spec/support/shoulda_matchers.rb'
      end
    end
  end
end
