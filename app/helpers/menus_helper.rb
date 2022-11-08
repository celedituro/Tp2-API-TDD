# Helper methods defined here can be accessed in any controller or view in the application

module WebTemplate
  class App
    module MenusHelper
      def menus_repository
        Persistence::Repositories::MenusRepository.new
      end

      def menus_to_json(menus)
        lista_de_menus = []
        menus.each do |menu|
          lista_de_menus.append({id: menu.id, nombre: menu.nombre, precio: menu.precio})
        end
        lista_de_menus.to_json
      end
    end

    helpers MenusHelper
  end
end
