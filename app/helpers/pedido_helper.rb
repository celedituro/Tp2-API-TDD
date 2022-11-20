module WebTemplate
  class App
    CANTIDAD_PARAMETROS_CALIFICACION = 3
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
          lista_de_pedidos.append({id_menu: pedido.menu.id, nombre_menu: pedido.menu.nombre, precio: pedido.menu.precio, id_pedido: pedido.id, estado: pedido.estado})
        end
        lista_de_pedidos.to_json
      end

      def comisiones_to_json(pedidos)
        lista_de_pedidos = []
        calculador = ComisionesCalculador.new(ServicioTiempo.new)
        pedidos.each do |pedido|
          lista_de_pedidos.append({id_pedido: pedido.id, comision: calculador.calcular(pedido)}) unless pedido.calificacion.nil?
        end
        lista_de_pedidos.to_json
      end

      def calificacion_pedido_to_json(pedido)
        {id_pedido: pedido.id, calificacion: pedido.calificacion}.to_json
      end

      def validar_calificacion(parametros_pedido)
        raise CantidadDeParametrosInvalida if parametros_pedido.length != CANTIDAD_PARAMETROS_CALIFICACION
      end

      private

      def atributos_pedido(pedido)
        {nombre_menu: pedido.menu.nombre, id_pedido: pedido.id, estado: pedido.estado, nombre_repartidor: pedido.repartidor.nil? ? 'No asignado' : pedido.repartidor.nombre_usuario}
      end
    end

    helpers PedidoHelper
  end
end
