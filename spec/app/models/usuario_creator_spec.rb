require 'spec_helper'

describe 'UsuarioCreator' do
  it 'debe crear y guardar un usuario' do
    nombre = 'Juan'
    direccion = 'Calle 12'
    telefono = '567-321'
    id = '12413673'
    usuario = instance_double(Usuario)
    repo = instance_double(Persistence::Repositories::UsuarioRepository)
    expect(Usuario).to receive(:new).with(nombre, direccion, telefono, id).and_return(usuario)
    expect(repo).to receive(:guardar).with(usuario).and_return(usuario)
    UsuarioCreator.new(repo).crear_usuario(nombre, direccion, telefono, id)
  end
end

