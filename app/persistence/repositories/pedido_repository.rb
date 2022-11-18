module Persistence
  module Repositories
    class PedidoRepository < BaseRepository
      self.table_name = :pedidos
      self.model_class = 'Pedido'

      # rubocop:disable Metrics/AbcSize
      def cargar_objeto(a_hash)
        usuario_repository = Persistence::Repositories::UsuarioRepository.new
        menus_repository = Persistence::Repositories::MenusRepository.new

        factory = EstadoFactory.new

        usuario = usuario_repository.buscar_por_id(a_hash[:id_usuario])
        menu = menus_repository.buscar_por_id(a_hash[:id_menu])
        estado = factory.get_estado(a_hash[:estado])
        pedido = Pedido.new(usuario, menu, estado)
        pedido.id = a_hash[:id]
        pedido.created_on = a_hash[:created_on]
        begin
          repartidor_repository = Persistence::Repositories::RepartidorRepository.new
          repartidor = repartidor_repository.buscar_por_id(a_hash[:nombre_repartidor])
          pedido.repartidor = repartidor
          pedido.calificacion = a_hash[:calificacion]
          pedido
        rescue ObjectNotFound
          pedido
        end
      end
      # rubocop:enable Metrics/AbcSize

      def buscar_pedidos_de(id_usuario)
        cargar_coleccion dataset.where(id_usuario_column => id_usuario)
      end

      def buscar_pedidos_de_repartidor(nombre_usuario)
        cargar_coleccion dataset.where(repartidor_column => nombre_usuario)
      end

      def repartidor_column
        Sequel[self.class.table_name][:nombre_repartidor]
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
          nombre_repartidor: pedido.repartidor.nil? ? nil : pedido.repartidor.nombre_usuario,
          created_on: pedido.created_on
        }
      end
    end
  end
end
