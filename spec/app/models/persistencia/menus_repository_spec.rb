require 'integration_helper'

describe Persistence::Repositories::MenusRepository do
  let(:menus_repository) { Persistence::Repositories::MenusRepository.new }
  let(:un_menu) { Menu.new(1,'Menu individual',100) }

  context 'cuando un menu ya existe' do

    it 'debe buscar un menu por id' do
        menu = menus_repository.buscar_por_id(1)
        expect(menu.nombre).to eq(un_menu.nombre)
    end

    it 'debe lanzar un error cuando no encuentra un usuario por id' do
        expect do
          menus_repository.buscar_por_id(10)
        end.to raise_error(ObjectNotFound)
      end
    end
end
