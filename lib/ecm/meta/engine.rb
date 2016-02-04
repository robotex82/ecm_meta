module Ecm
  module Meta
    class Engine < ::Rails::Engine
      isolate_namespace Ecm::Meta
    end
  end
end
