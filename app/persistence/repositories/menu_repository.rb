module Persistence
  module Repositories
    class MenusRepository < BaseRepository
      self.table_name = :menus
      self.model_class = 'Menu'

      def cargar_objeto(a_hash)
        Menu.new(a_hash[:id], a_hash[:nombre], a_hash[:precio])
      end

      def changeset(menu)
        {
          id: menu.id,
          nombre: menu.nombre,
          precio: menu.precio
        }
      end
    end
  end
end
