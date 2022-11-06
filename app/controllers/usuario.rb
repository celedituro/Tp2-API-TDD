WebTemplate::App.controllers :users, :provides => [:json] do
  post :create, :map => '/registrar' do
    begin
      usuario = UsuarioCreator.new(usuario_repository).crear_usuario(parametros_usuario[:nombre], parametros_usuario[:direccion], parametros_usuario[:telefono])
      status 201
      usuario_to_json usuario
    rescue UsuarioInvalido => e
      status 400
      {message: 'Bad Request'}.to_json
    rescue UsuarioDuplicado => e
      status 409
      {message: 'Conflict'}.to_json
    end
  end
end
