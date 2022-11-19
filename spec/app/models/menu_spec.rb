require 'spec_helper'

describe Menu do
  context 'cuando es creado' do
    it 'debe ser invalido cuando el nombre no esta' do
      expect { described_class.new(1,nil,100) }.to raise_error(MenuInvalido, 'menu invalido')
    end

    it 'debe ser invalido cuando el precio es negativo' do
        expect { described_class.new(2,'menu 2',-3) }.to raise_error(MenuInvalido, 'menu invalido')
    end
  end
end
