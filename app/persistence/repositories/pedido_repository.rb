module Persistence
  module Repositories
    class PedidoRepository < BaseRepository
      self.table_name = :pedidos
      self.model_class = 'Pedido'

      def cargar_objeto(a_hash)
        usuario = usuario_repository.buscar_por_id(a_hash[:id_usuario])
        menu = menus_repository.buscar_por_id(a_hash[:id_menu])
        pedido = Pedido.new(usuario, menu)
        pedido.id = a_hash[:id]
        pedido
      end

      def changeset(pedido)
        {
          id_usuario: pedido.id_usuario,
          id_menu: pedido.id_menu,
          estado: pedido.estado
        }
      end
    end
  end
end
