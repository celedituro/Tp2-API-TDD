# Helper methods defined here can be accessed in any controller or view in the application

module WebTemplate
  class App
    module MenusHelper
      def menus_repository
        Persistence::Repositories::MenuRepository.new
      end

      def menus_to_json(menus)
        menus.to_json
      end
    end

    helpers MenusHelper
  end
end
