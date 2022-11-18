require 'integration_helper'

describe Persistence::Repositories::UsuarioRepository do
  let(:usuario_repository) { Persistence::Repositories::UsuarioRepository.new }
  let(:un_usuario) { Usuario.new('Pepe','direccion','telefono','123456')}

  it 'debe guardar un nuevo user' do
    usuario_repository.guardar(un_usuario)
    expect(usuario_repository.obtener_todos.count).to eq(1)
  end

  context 'cuando un usuario ya existe' do
    before :each do
        @nuevo_usuario = usuario_repository.guardar(un_usuario)
        @usuario_id = @nuevo_usuario.id
    end

    it 'debe actualizar el nombre' do
      @nuevo_usuario.nombre = 'Paul'
      usuario_repository.actualizar(@nuevo_usuario)
      expect(usuario_repository.buscar_por_id(@usuario_id).nombre).to eq('Paul')
    end

    it 'no debe crear un nuevo usuario' do
      @nuevo_usuario.nombre = 'Juan'
      expect do
        usuario_repository.guardar(@nuevo_usuario)
      end.to raise_error(Duplicado)
    end

    it 'debe eliminar todos los usuarios' do
      usuario_repository.eliminar_todos

      expect(usuario_repository.obtener_todos.count).to eq(0)
    end

    it 'debe buscar un user por id' do
      usuario = usuario_repository.buscar_por_id(@usuario_id)

      expect(usuario.nombre).to eq(@nuevo_usuario.nombre)
    end
  end

  it 'debe lanzar un error cuando no encuentra un usuario por id' do
    expect do
      usuario_repository.buscar_por_id('99_999')
    end.to raise_error(ObjectNotFound)
  end
end