require 'spec_helper'

describe Pedido do
  context 'cuando es creado' do
    
    it 'debe ser invalido cuando el menu no esta' do
        usuario = Usuario.new('nombre','direccion','123456',1)
        expect { described_class.new(usuario,nil)}.to raise_error(PedidoInvalido, 'pedido invalido')
    end

    it 'debe ser invalido cuando responsable no esta' do
      menu = Menu.new(4,'Menu individual', 200)
      expect { described_class.new(nil,menu) }.to raise_error(PedidoInvalido, 'pedido invalido')
    end

    it 'su estado inicial debe ser recibido' do
      menu = Menu.new(4,'Menu individual', 200)
      usuario = Usuario.new('nombre','direccion','123456',1)
      expect(described_class.new(usuario,menu).estado).to eq('recibido')
    end
end
end
