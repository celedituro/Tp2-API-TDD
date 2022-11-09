require 'spec_helper'

describe Usuario do
  context 'cuando es creado' do
    it 'debe ser invalido cuando el nombre no esta' do
      expect { described_class.new(nil,'direccion','1', 1) }.to raise_error(UsuarioInvalido, 'usuario invalido')
    end

    it 'debe ser invalido cuando la direccion no esta' do
        expect { described_class.new('Juan',nil,'1', 1) }.to raise_error(UsuarioInvalido, 'usuario invalido')
    end

    it 'debe ser invalido cuando el telefono no esta' do
        expect { described_class.new('Juan','direccion',nil, 1) }.to raise_error(UsuarioInvalido, 'usuario invalido')
    end

    it 'debe ser invalido cuando el id no esta' do
      expect { described_class.new('Juan','direccion','456262', nil) }.to raise_error(UsuarioInvalido, 'usuario invalido')
    end
  end

end
