module Ecm::Meta
  module Generators
    class MigrationsGenerator < Rails::Generators::Base
      desc 'Installs all ECM Module Migrations'

      def install_migrations
        require 'rake'

        Rake::Task.clear # necessary to avoid tasks being loaded several times in dev mode
        Rails.application.load_tasks # providing your application name is 'sample'

        ecm_modules.each do |ecm_module|
          enable_tasks_for_install_migrations
          puts "Installing migrations for #{ecm_module}"
          Rake::Task["#{ecm_module}:install:migrations"].invoke
        end
      end

      def migrate
        enable_tasks_for_db_migrate
        Rake::Task["db:migrate"].invoke
      end

      private

      def ecm_modules
        [ecm_isolated_modules, ecm_full_modules].flatten.map { |s| s.prepend('ecm_') }.sort
      end

      def ecm_isolated_modules
        %w(user_area youtube)
      end

      def ecm_full_modules
        %w(cms downloads news links pictures references).map { |s| s << '_engine' }
      end

      def enable_tasks_for_install_migrations
        Rake::Task['railties:install:migrations'].reenable
        Rake::Task['db:load_config'].reenable
      end

      def enable_tasks_for_db_migrate
        Rake::Task['db:migrate'].reenable
        Rake::Task['environment'].reenable
        Rake::Task['db:load_config'].reenable
        Rake::Task['db:_dump'].reenable
        Rake::Task['db:schema:dump'].reenable
      end
    end
  end
end
