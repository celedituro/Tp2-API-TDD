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
    begin
      pedido = pedido_repository.buscar_por_id(params[:id])
      status 200
      pedido_to_json pedido
    rescue ObjectNotFound
      {nombre_menu: '', id_pedido: 0, estado: ''}.to_json
    end
  end

  get :pedidos, :map => '/pedidos', :with => :id do
    begin
      pedidos = pedido_repository.buscar_pedidos_de(params[:id])
      status 200
      pedidos_to_json pedidos
    rescue ObjectNotFound
      [].to_json
    end
  end

  patch :update, :map => '/pedido' do
    begin
      pedido = pedido_repository.buscar_por_id(params[:id])
      pedido.actualizar
      pedido_repository.actualizar(pedido)

      status 202
      pedido_to_json pedido
    rescue ObjectNotFound
      {nombre_menu: '', id_pedido: 0, estado: ''}.to_json
    rescue PedidoYaEntregado
      pedido = pedido_repository.buscar_por_id(params[:id])

      status 202
      pedido_to_json pedido
    end
  end

  patch :update, :map => '/cancelacion' do
    pedido = pedido_repository.buscar_por_id(params[:id])
    pedido.cancelar
    pedido_repository.actualizar(pedido)

    status 200
    pedido_to_json pedido
  end

  patch :update, :map => '/calificacion' do
    pedido = pedido_repository.buscar_por_id(parametros_pedido[:id_pedido])
    pedido.calificar(parametros_pedido[:calificacion])
    # pedido_repository.actualizar(pedido)

    status 200
    {id_pedido: pedido.id}.to_json
  end
end
