# Helper methods defined here can be accessed in any controller or view in the application

module WebTemplate
  class App
    module RepartidorHelper
      def repartidor_repository
        Persistence::Repositories::RepartidorRepository.new
      end

      def parametros_repartidor
        @body ||= request.body.read
        JSON.parse(@body).symbolize_keys
      end

      def repartidor_to_json(repartidor)
        atributos_repartidor(repartidor).to_json
      end

      private

      def atributos_repartidor(repartidor)
        {nombre_usuario: repartidor.nombre_usuario, nombre: repartidor.nombre}
      end
    end
    helpers RepartidorHelper
  end
end
