module Ecm::Meta
  module Generators
    class ConfigureGenerator < Rails::Generators::Base
      desc 'Configures the Rails Application'

      source_root File.expand_path('../templates', __FILE__)
 
      def configure_timezone
        timezone = ask("Timezone (i.e. Europe/Berlin): ")
        if timezone.present?
          insert_into_file 'config/application.rb', after: "# config.time_zone = 'Central Time (US & Canada)'\n" do
            "    config.time_zone = '#{timezone}'\n"
          end
        end
      end
 
      def configure_default_locale
        default_locale = ask("Default locale (i.e. de): ")
        if default_locale.present?
          insert_into_file 'config/application.rb', after: "# config.i18n.default_locale = :de\n" do
            "    config.i18n.default_locale = :#{default_locale}\n"
          end
        end
      end

      def configure_available_locales
        available_locales = ask("Available locales (i.e. de en es): ")
        if available_locales.present?
          insert_into_file 'config/application.rb', after: "# config.i18n.default_locale = :de\n" do
            "    config.i18n.available_locales = %i(#{available_locales})\n"
          end
        end
      end

      def configure_web_console
        say "web console configuration:"
        if (ip_range = ask("Do you want to set a whitelisted ip range for web console in development (i.e. 192.168.0.0/24)?")).present?
          insert_into_file 'config/environments/development.rb', before: "\nend" do
            "\n\n  config.web_console.whitelisted_ips = '#{ip_range}'"
          end
        end
      end

      def configure_unpermitted_params
        say "unpermitted params configuration:"
        if yes?("Do you want to raise on unmpermitted params in development?")
          insert_into_file 'config/environments/development.rb', before: "\nend" do
            "\n\n  # Raises an error on unpermitted attributes assignment\n  config.action_controller.action_on_unpermitted_parameters = :raise"
          end
        end
      end
    end
  end
end
