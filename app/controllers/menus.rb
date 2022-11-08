WebTemplate::App.controllers :menus, :provides => [:json] do
  get :index, :map => '/menus' do
    menus = menus_repository.obtener_todos
    status 200
    menus_to_json menus
  end
end
