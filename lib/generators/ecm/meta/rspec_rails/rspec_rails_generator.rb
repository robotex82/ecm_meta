module Ecm::Meta
  module Generators
    class RspecRailsGenerator < Rails::Generators::Base
      desc 'Installs Rspec'

      def add_to_application_gemfile
        append_file 'Gemfile.application', "gem 'rspec-rails', groups: [:development, :test]"
        %x(bundle install)
        Rails::Generators.invoke("rspec:install")

        if yes? "Do you want to auto require files in spec/support when running specs?"
          inject_into_file 'spec/rails_helper.rb', after: "# Dir[Rails.root.join('spec/support/**/*.rb')].each { |f| require f }" do
            "\nDir[Rails.root.join('spec/support/**/*.rb')].each { |f| require f }"
          end
        end
      end
    end
  end
end
