# Helper methods defined here can be accessed in any controller or view in the application

module WebTemplate
  class App
    module UsuarioHelper
      def usuario_repository
        Persistence::Repositories::UsuarioRepository.new
      end

      def parametros_usuario
        @body ||= request.body.read
        JSON.parse(@body).symbolize_keys
      end

      def usuario_to_json(usuario)
        atributos_usuario(usuario).to_json
      end

      private

      def atributos_usuario(usuario)
        {nombre: usuario.nombre, telefono: usuario.telefono, direccion: usuario.direccion, id: usuario.id}
      end
    end

    helpers UsuarioHelper
  end
end
