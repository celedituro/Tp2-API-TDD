WebTemplate::App.controllers :users, :provides => [:json] do
  post :create, :map => '/repartidor' do
    status 201
  end
end
