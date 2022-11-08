module Persistence
  module Repositories
    class MenuRepository
      def obtener_todos
        [{'id': 1, 'nombre': 'Menu individual', 'precio': 100}, {'id': 2, 'nombre': 'Menu parejas', 'precio': 175}, {'id': 3, 'nombre': 'Menu familiar', 'precio': 250}]
      end
    end
  end
end
