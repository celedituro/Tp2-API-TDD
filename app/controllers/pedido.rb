WebTemplate::App.controllers :pedidos, :provides => [:json] do
  post :create, :map => '/pedidos' do
    begin
      pedido = PedidoCreator.new(pedido_repository, usuario_repository, menus_repository).crear_pedido(parametros_pedido[:id_usuario], parametros_pedido[:id_menu])
      status 201
      pedido_to_json pedido
    rescue UsuarioNoRegistrado
      status 401
      {message: 'Unauthorized'}.to_json
    rescue MenuInvalido
      status 400
      {message: 'Bad Request'}.to_json
    end
  end

  get :index, :map => '/pedidos', :with => :id do
    begin
      pedido = pedido_repository.buscar_por_id(params[:id])
      status 200
      pedido_to_json pedido
    rescue ObjectNotFound
      status 404
      {message: 'Not Found'}.to_json
    end
  end

  get :pedidos, :map => '/todos', :with => :id do
    begin
      pedidos = pedido_repository.buscar_pedidos_de(params[:id])
      status 200
      pedidos_to_json pedidos
    rescue ObjectNotFound
      [].to_json
    end
  end

  patch :update, :map => '/pedidos' do
    begin
      pedido = pedido_repository.buscar_por_id(params[:id])
      pedido.actualizar
      pedido_repository.actualizar(pedido)

      status 202
      pedido_to_json pedido
    rescue ObjectNotFound
      {nombre_menu: '', id_pedido: 0, estado: ''}.to_json
    rescue PedidoYaEntregado
      status 202
      pedido_to_json pedido
    end
  end

  patch :update, :map => '/cancelaciones' do
    begin
      pedido = pedido_repository.buscar_por_id(params[:id])
      pedido.cancelar
      pedido_repository.actualizar(pedido)

      status 200
      pedido_to_json pedido
    rescue CancelarPedidoError
      status 401
      {message: 'Unauthorized'}.to_json
    end
  end

  patch :update, :map => '/calificaciones' do
    begin
      validar_calificacion(parametros_pedido)
      pedido = pedido_repository.buscar_por_id(parametros_pedido[:id_pedido])
      pedido.calificar(Integer(parametros_pedido[:calificacion]))
      pedido_repository.actualizar(pedido)

      status 200
      calificacion_pedido_to_json pedido
    rescue CalificacionInvalida
      status 401
      {message: 'Unauthorized'}.to_json
    rescue CantidadDeParametrosInvalida, CalificacionRangoInvalido
      status 400
      {message: 'Bad Request'}.to_json
    end
  end
end
