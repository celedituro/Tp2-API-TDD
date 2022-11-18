require 'integration_helper'

describe Persistence::Repositories::PedidoRepository do
  let(:pedido_repository) { Persistence::Repositories::PedidoRepository.new }
  let(:usuario_repository) { Persistence::Repositories::UsuarioRepository.new }
  let(:repartidor_repository) { Persistence::Repositories::RepartidorRepository.new }
  let(:responsable) { Usuario.new('Pepe','direccion','telefono','123456')}
  let(:menu) { Menu.new(1,'Menu individual',100)}
  let(:un_pedido) { Pedido.new(responsable, menu, EstadoRecibido.new)}

  it 'debe guardar un nuevo pedido' do
    usuario_repository.guardar(responsable)
    pedido_repository.guardar(un_pedido)
    expect(pedido_repository.obtener_todos.count).to eq(1)
  end

  context 'cuando un pedido ya existe' do
    before :each do
      usuario_repository.guardar(responsable)
      @nuevo_pedido = pedido_repository.guardar(un_pedido)
      @pedido_id = @nuevo_pedido.id
    end

    it 'debe actualizar el repartidor' do
      repartidor = Repartidor.new('Paulito', 'Paul')
      repartidor_repository.guardar(repartidor)
      @nuevo_pedido.repartidor = repartidor
      pedido_repository.actualizar(@nuevo_pedido)

      expect(pedido_repository.buscar_por_id(@pedido_id).repartidor.nombre_usuario).to eq('Paulito')
    end

    it 'debe eliminar todos los pedidos' do
      pedido_repository.eliminar_todos

      expect(pedido_repository.obtener_todos.count).to eq(0)
    end

    it 'debe buscar un pedido por id' do
      pedido = pedido_repository.buscar_por_id(@pedido_id)

      expect(pedido.responsable.nombre).to eq(@nuevo_pedido.responsable.nombre)
    end
  end

  it 'debe lanzar un error cuando no encuentra un pedido por id' do
    expect do
      pedido_repository.buscar_por_id(99999)
    end.to raise_error(ObjectNotFound)
  end
end
