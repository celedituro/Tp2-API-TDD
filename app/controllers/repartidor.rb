WebTemplate::App.controllers :users, :provides => [:json] do
  post :create, :map => '/repartidores' do
    begin
      repartidor = RepartidorCreator.new(repartidor_repository).crear_repartidor(parametros_repartidor[:nombre_usuario], parametros_repartidor[:nombre])
      status 201
      repartidor_to_json repartidor
    rescue RepartidorInvalido
      status 400
      {message: 'Bad Request'}.to_json
    rescue Duplicado
      status 409
      {message: 'Conflict'}.to_json
    end
  end

  get :comisiones, :map => '/comisiones', :with => :id do
    begin
      pedidos = pedido_repository.buscar_pedidos_de_repartidor(params[:id])
      status 200
      comisiones_to_json pedidos
    rescue ObjectNotFound
      [].to_json
    end
  end
end
