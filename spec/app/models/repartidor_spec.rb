require 'spec_helper'

describe Repartidor do
  context 'cuando es creado' do
    it 'debe ser invalido cuando el nombre de usuario no esta' do
      expect { described_class.new(nil,'Juan') }.to raise_error(RepartidorInvalido, 'repartidor invalido')
    end

    it 'debe ser invalido cuando el nombre no esta' do
      expect { described_class.new('juangomezz',nil) }.to raise_error(RepartidorInvalido, 'repartidor invalido')
    end
  end

end
