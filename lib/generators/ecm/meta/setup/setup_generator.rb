module Ecm::Meta
  module Generators
    class SetupGenerator < Rails::Generators::Base
      desc 'Setup Tools'

      source_root File.expand_path('../templates', __FILE__)

      def configure_ruby_version 
        say "Ruby configuration:"
        if (ruby_version = ask("Which ruby version do you want to use (i.e. 2.2.3)? ")).present?
          create_file '.ruby-version', ruby_version
        end

        if (ruby_gemset = ask("Which gemset do you want to use (i.e. default)? ")).present?
          create_file '.ruby-gemset', ruby_gemset
        end
      end

      def add_application_gemfile
        say "Adding Gemfile.application"
        append_file 'Gemfile', "\n\neval_gemfile File.join(File.dirname(__FILE__), 'Gemfile.application')"
        create_file 'Gemfile.application'
      end

      def add_gems
        say "Test suite"
        %w(rspec-rails capybara factory_girl_rails formulaic shoulda-matchers).map(&:underscore).each do |gem_name|
          if yes? "Do you want to add #{gem_name}?"
            Rails::Generators.invoke("ecm:meta:#{gem_name}")
          end
        end

        say "CI"
        %w(guard-bundler guard-rails guard-rspec guard-rubocop).map(&:underscore).each do |gem_name|
          if yes? "Do you want to add #{gem_name}?"
            Rails::Generators.invoke("ecm:meta:#{gem_name}")
          end
        end

        say "Other Tools"
        %w(yaml_db).each do |gem_name|
          if yes? "Do you want to add #{gem_name}?"
            Rails::Generators.invoke("ecm:meta:#{gem_name}")
          end
        end
      end

      def frontend_gems
        say "Frontend"
        %w(haml-rails twitter-bootstrap-rails simple_form route_translator).map(&:underscore).each do |gem_name|
          if yes? "Do you want to add #{gem_name}?"
            Rails::Generators.invoke("ecm:meta:#{gem_name}")
          end
        end
      end
    end
  end
end
