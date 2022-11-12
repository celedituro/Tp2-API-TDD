require 'spec_helper'

describe Pedido do
  context 'cuando es creado' do
    
    it 'debe ser invalido cuando el menu no esta' do
        usuario = Usuario.new('nombre','direccion','123456',1)
        expect { described_class.new(usuario,nil,EstadoRecibido.new)}.to raise_error(PedidoInvalido, 'pedido invalido')
    end

    it 'debe ser invalido cuando responsable no esta' do
      menu = Menu.new(4,'Menu individual', 200)
      expect { described_class.new(nil,menu,EstadoRecibido.new) }.to raise_error(PedidoInvalido, 'pedido invalido')
    end

    it 'su estado inicial debe ser recibido' do
      menu = Menu.new(4,'Menu individual', 200)
      usuario = Usuario.new('nombre','direccion','123456',1)
      expect(described_class.new(usuario,menu,EstadoRecibido.new).estado).to eq('recibido')
    end
  end

  it 'su estado es en preparación cuando lo actualizo por primera vez' do
    menu = Menu.new(4,'Menu individual', 200)
    usuario = Usuario.new('nombre','direccion','123456',1)
    pedido = described_class.new(usuario,menu,EstadoRecibido.new)
    pedido.actualizar
    expect(pedido.estado).to eq('en preparación')
  end

  it 'su estado es en camino cuando lo actualizo por segunda vez' do
    menu = Menu.new(4,'Menu individual', 200)
    usuario = Usuario.new('nombre','direccion','123456',1)
    pedido = described_class.new(usuario,menu,EstadoEnPreparacion.new)
    pedido.actualizar
    expect(pedido.estado).to eq('en camino')
  end

  it 'su estado es entregado cuando lo actualizo estando en camino' do
    menu = Menu.new(4,'Menu individual', 200)
    usuario = Usuario.new('nombre','direccion','123456',1)
    pedido = described_class.new(usuario,menu,EstadoEnCamino.new)
    pedido.actualizar
    expect(pedido.estado).to eq('entregado')
  end

  it 'su estado es cancelado cuando lo cancelo estando recibido' do
    menu = Menu.new(4,'Menu individual', 200)
    usuario = Usuario.new('nombre','direccion','123456',1)
    pedido = described_class.new(usuario,menu,EstadoRecibido.new)
    pedido.cancelar
    expect(pedido.estado).to eq('cancelado')
  end
end
