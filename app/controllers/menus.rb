WebTemplate::App.controllers :menus, :provides => [:json] do
  get :index, :map => '/menus', :with => :id do
    begin
      Autorizacion.new(usuario_repository).autorizar(params[:id])
      menus = menus_repository.obtener_todos
      status 200
      menus_to_json menus
    rescue UsuarioNoRegistrado
      status 401
      {message: 'Unauthorized'}.to_json
    end
  end
end
