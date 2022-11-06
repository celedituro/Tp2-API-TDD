WebTemplate::App.controllers :users, :provides => [:json] do
  post :create, :map => '/registrar' do
    begin
      usuario = UsuarioCreator.new(usuario_repository).crear_usuario(parametros_usuario[:nombre], parametros_usuario[:direccion], parametros_usuario[:telefono])
      status 201
      usuario_to_json usuario
    rescue UsuarioInvalido => e
      status 400
      {error: e.message}.to_json
    end
  end
end
