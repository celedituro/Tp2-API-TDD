WebTemplate::App.controllers :users, :provides => [:json] do
  post :create, :map => '/registrar' do
    # begin
    #   new_user = UserCreator.new(user_repo, self).create_user(user_params[:name]) # User.new(user_params[:name])
    #   status 201
    #   user_to_json new_user
    # rescue InvalidUser => e
    #   status 400
    #   {error: e.message}.to_json
    # end
    usuario = UsuarioCreator.new(usuario_repository).crear_usuario(parametros_usuario[:nombre], parametros_usuario[:direccion], parametros_usuario[:telefono])
    status 201
    usuario_to_json usuario
  end
end
