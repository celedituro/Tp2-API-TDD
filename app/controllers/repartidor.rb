WebTemplate::App.controllers :users, :provides => [:json] do
  post :create, :map => '/repartidor' do
    # repartidor = RepartidorCreator.new(repartidor_repository).crear_repartidor('fulanomengano','Fulano Mengano')
    repartidor = Repartidor.new('fulanomengano', 'Fulano Mengano')
    status 201
    {nombre_usuario: repartidor.nombre_usuario, nombre: repartidor.nombre}.to_json
  end
end
