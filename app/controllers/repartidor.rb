WebTemplate::App.controllers :users, :provides => [:json] do
  post :create, :map => '/repartidor' do
    repartidor = RepartidorCreator.new(repartidor_repository).crear_repartidor(parametros_repartidor[:nombre_usuario], parametros_repartidor[:nombre])
    status 201
    repartidor_to_json repartidor
  end
end
