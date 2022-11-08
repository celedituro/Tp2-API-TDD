# write seeds here
require_relative '../models/menu'

menus_repository = MenusRepository.new
menu1 = Menu.new(1, 'Menu individual', 100)
menu2 = Menu.new(2, 'Menu parejas', 175)
menu3 = Menu.new(3, 'Menu familiar', 250)

menus_repository.save menu1
menus_repository.save menu2
menus_repository.save menu3
