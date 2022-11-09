module WebTemplate
  class App
    module PedidoHelper
      def pedido_repository
         Persistence::Repositories::PedidoRepository.new
      end

      def parametros_pedido
        @body ||= request.body.read
        JSON.parse(@body).symbolize_keys
      end

      def pedido_to_json(pedido)
        atributos_pedido(pedido).to_json
      end

      private

      def atributos_pedido(pedido)
        {nombre_menu: pedido.nombre_menu, id_pedido: pedido.id}
      end

      # def user_mapper
      #  Persistence::Mappers::UserMapper.new
      # end
    end

    helpers PedidoHelper
  end
end
