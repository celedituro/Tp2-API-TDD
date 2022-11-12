module Persistence
  module Repositories
    class PedidoRepository < BaseRepository
      self.table_name = :pedidos
      self.model_class = 'Pedido'

      def cargar_objeto(a_hash)
        usuario_repository = Persistence::Repositories::UsuarioRepository.new
        usuario = usuario_repository.buscar_por_id(a_hash[:id_usuario])
        menus_repository = Persistence::Repositories::MenusRepository.new
        menu = menus_repository.buscar_por_id(a_hash[:id_menu])
        factory = EstadoFactory.new
        estado = factory.get_estado(a_hash[:estado])
        pedido = Pedido.new(usuario, menu, estado)
        pedido.id = a_hash[:id]
        pedido
      end

      def buscar_pedidos_de(id_usuario)
        dataset.where(id_usuario_column => id_usuario)
      end

      def id_usuario_column
        Sequel[self.class.table_name][:id_usuario]
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
