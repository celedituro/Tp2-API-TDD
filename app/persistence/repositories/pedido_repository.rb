module Persistence
  module Repositories
    class PedidoRepository < BaseRepository
      self.table_name = :pedidos
      self.model_class = 'Pedido'

      def cargar_objeto(a_hash)
        begin
          usuario_repository = Persistence::Repositories::UsuarioRepository.new
          menus_repository = Persistence::Repositories::MenusRepository.new
          repartidor_repository = Persistence::Repositories::RepartidorRepository.new
          factory = EstadoFactory.new

          usuario = usuario_repository.buscar_por_id(a_hash[:id_usuario])
          menu = menus_repository.buscar_por_id(a_hash[:id_menu])
          repartidor = repartidor_repository.buscar_por_id(a_hash[:nombre_repartidor])

          estado = factory.get_estado(a_hash[:estado])
          pedido = Pedido.new(usuario, menu, estado)
          pedido.asignar_repartidor(repartidor)
          pedido.id = a_hash[:id]
          pedido
        rescue ObjectNotFound
          usuario_repository = Persistence::Repositories::UsuarioRepository.new
          menus_repository = Persistence::Repositories::MenusRepository.new
          factory = EstadoFactory.new

          usuario = usuario_repository.buscar_por_id(a_hash[:id_usuario])
          menu = menus_repository.buscar_por_id(a_hash[:id_menu])

          estado = factory.get_estado(a_hash[:estado])
          pedido = Pedido.new(usuario, menu, estado)
          pedido.id = a_hash[:id]
          pedido
        end
      end

      def buscar_pedidos_de(id_usuario)
        cargar_coleccion dataset.where(id_usuario_column => id_usuario)
      end

      def id_usuario_column
        Sequel[self.class.table_name][:id_usuario]
      end

      def changeset(pedido)
        {
          id_usuario: pedido.id_usuario,
          id_menu: pedido.id_menu,
          estado: pedido.estado,
          calificacion: pedido.calificacion,
          nombre_repartidor: pedido.repartidor.nil? ? nil : pedido.nombre_repartidor
        }
      end
    end
  end
end
