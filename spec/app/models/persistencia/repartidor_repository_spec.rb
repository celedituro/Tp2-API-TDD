require 'integration_helper'

describe Persistence::Repositories::RepartidorRepository do
  let(:repartidor_repository) { Persistence::Repositories::RepartidorRepository.new }
  let(:un_repartidor) { Repartidor.new('Pepe','Pedro')}

  it 'debe guardar un nuevo repartidor' do
    repartidor_repository.guardar(un_repartidor)
    expect(repartidor_repository.obtener_todos.count).to eq(1)
  end

  context 'cuando un usuario ya existe' do
    before :each do
      @nuevo_repartidor = repartidor_repository.guardar(un_repartidor)
      @nombre_usuario = @nuevo_repartidor.nombre_usuario
    end

    it 'debe devolver un repartidor libre' do
      expect(repartidor_repository.buscar_repartidores_libres.count).to eq(1)
    end

    it 'debe actualizar el esta_libre' do
      @nuevo_repartidor.esta_libre = false
      repartidor_repository.actualizar(@nuevo_repartidor)
      expect(repartidor_repository.buscar_por_id(@nombre_usuario).esta_libre).to eq(false)
    end

    it 'debe devolver ningun repartidor libre' do
      @nuevo_repartidor.esta_libre = false
      repartidor_repository.actualizar(@nuevo_repartidor)
      expect(repartidor_repository.buscar_repartidores_libres.count).to eq(0)
    end

    it 'debe eliminar todos los repartidores' do
      repartidor_repository.eliminar_todos

      expect(repartidor_repository.obtener_todos.count).to eq(0)
    end

    it 'debe buscar un repartidor por nombre_usuario' do
      repartidor = repartidor_repository.buscar_por_id(@nombre_usuario)

      expect(repartidor.nombre_usuario).to eq(@nombre_usuario)
    end
  end

  it 'debe lanzar un error cuando no encuentra un repartidor por nombre_usuario' do
    expect do
      repartidor_repository.buscar_por_id('99_999')
    end.to raise_error(ObjectNotFound)
  end
end
