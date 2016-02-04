module Ecm::Meta
  module Generators
    class InstallGenerator < Rails::Generators::Base
      desc 'Installs all ECM Modules'

      def install_itsf_backend
        Rails::Generators.invoke('itsf:backend:install')
      end

      def install_modules
        ecm_modules.each do |ecm_module|
          Rails::Generators.invoke("ecm:#{ecm_module}:install")
        end
      end

      def install_backend_modules
        ecm_backend_modules.each do |ecm_backend_module|
          Rails::Generators.invoke("ecm:#{ecm_backend_module}:backend:install")
        end
      end

      private

      def ecm_modules
        %w(contact downloads news links lightbox pictures references user_area cms youtube)
      end

      def ecm_backend_modules
        %w(cms downloads news links pictures references user_area youtube)
      end
    end
  end
end
