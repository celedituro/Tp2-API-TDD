WebTemplate::App.controllers :pedidos, :provides => [:json] do
  post :create, :map => '/pedido' do
    begin
      pedido = PedidoCreator.new(pedido_repository, usuario_repository, menus_repository).crear_pedido(parametros_pedido[:id_usuario], parametros_pedido[:id_menu])
      status 201
      pedido_to_json pedido
    rescue UsuarioNoRegistrado
      status 401
    end
  end

  get :index, :map => '/pedido', :with => :id do
    pedido = pedido_repository.buscar_por_id(params[:id])

    status 200
    pedido_to_json pedido
  end

  patch :update, :map => '/pedido' do
    pedido = pedido_repository.buscar_por_id(params[:id])
    pedido.actualizar
    pedido_repository.actualizar(pedido)

    status 202
    pedido_to_json pedido
  end
end
