WebTemplate::App.controllers :users, :provides => [:json] do
  post :create, :map => '/repartidor' do
    repartidor = RepartidorCreator.new(repartidor_repository).crear_repartidor(parametros_repartidor[:nombre_usuario], parametros_repartidor[:nombre])
    status 201
    repartidor_to_json repartidor
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
