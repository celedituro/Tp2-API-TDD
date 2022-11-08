# write seeds here
require_relative '../app/models/menu'
require_relative '../app/persistence/repositories/menu_repository'

menus_repository = Persistence::Repositories::MenusRepository.new
menu1 = Menu.new(1, 'Menu individual', 100)
menu2 = Menu.new(2, 'Menu parejas', 175)
menu3 = Menu.new(3, 'Menu familiar', 250)

menus_repository.guardar menu1
menus_repository.guardar menu2
menus_repository.guardar menu3
