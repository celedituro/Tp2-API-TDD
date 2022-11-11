WebTemplate::App.controllers :users, :provides => [:json] do
  post :create, :map => '/registrar' do
    begin
      #usuario = UsuarioCreator.new(usuario_repository).crear_usuario(parametros_usuario[:nombre], parametros_usuario[:direccion], parametros_usuario[:telefono], parametros_usuario[:id])
      usuario = UsuarioCreator.new(usuario_repository).crear_usuario(parametros_usuario[:nombre], parametros_usuario[:direccion], parametros_usuario[:telefono], 1)
      status 201
      usuario_to_json usuario
    rescue UsuarioInvalido
      status 400
      {message: 'Bad Request'}.to_json
    rescue Duplicado
      status 409
      {message: 'Conflict'}.to_json
    end
  end
end
