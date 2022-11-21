require 'spec_helper'

describe 'RepartidorCreator' do
  it 'debe crear y guardar un repartidor' do
    nombre_usuario = 'juanrepartidor'
    nombre = 'Juan'
    repartidor = instance_double(Repartidor)
    repo = instance_double(Persistence::Repositories::RepartidorRepository)
    expect(Repartidor).to receive(:new).with(nombre_usuario, nombre).and_return(repartidor)
    expect(repo).to receive(:guardar).with(repartidor).and_return(repartidor)
    RepartidorCreator.new(repo).crear_repartidor(nombre_usuario, nombre)
  end
end

