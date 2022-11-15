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

      def pedidos_to_json(pedidos)
        lista_de_pedidos = []
        pedidos.each do |pedido|
          lista_de_pedidos.append({id_menu: pedido.id_menu, nombre_menu: pedido.nombre_menu, precio: pedido.precio_menu, id_pedido: pedido.id, estado: pedido.estado})
        end
        lista_de_pedidos.to_json
      end

      def calificacion_pedido_to_json(pedido)
        {id_pedido: pedido.id, calificacion: pedido.calificacion}.to_json
      end

      private

      def atributos_pedido(pedido)
        if !pedido.repartidor.nil?
          {nombre_menu: pedido.nombre_menu, id_pedido: pedido.id, estado: pedido.estado, nombre_repartidor: pedido.repartidor.nombre_usuario}
        else
          {nombre_menu: pedido.nombre_menu, id_pedido: pedido.id, estado: pedido.estado}
        end
      end
    end

    helpers PedidoHelper
  end
end
