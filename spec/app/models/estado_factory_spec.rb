require 'spec_helper'

describe EstadoFactory do
    it 'debe crear una instancia de EstadoRecibido al pasarle recibido como parametro' do
      factory = described_class.new()

      expect(factory.get_estado('recibido')).to be_an_instance_of(EstadoRecibido)
    end

    it 'debe crear una instancia de EstadoEnPreparacion al pasarle en preparación como parametro' do
        factory = described_class.new()
  
        expect(factory.get_estado('en preparación')).to be_an_instance_of(EstadoEnPreparacion)
    end

    it 'debe crear una instancia de EstadoEnCamino al pasarle en camino como parametro' do
        factory = described_class.new()
  
        expect(factory.get_estado('en camino')).to be_an_instance_of(EstadoEnCamino)
    end

    it 'debe crear una instancia de EstadoEntregado al pasarle entregado como parametro' do
        factory = described_class.new()
  
        expect(factory.get_estado('entregado')).to be_an_instance_of(EstadoEntregado)
    end

    it 'debe crear una instancia de EstadoCancelado al pasarle cancelado como parametro' do
      factory = described_class.new()

      expect(factory.get_estado('cancelado')).to be_an_instance_of(EstadoCancelado)
    end

    it 'debe crear una instancia de EstadoEnEspera al pasarle en espera como parametro' do
      factory = described_class.new()

      expect(factory.get_estado('en espera')).to be_an_instance_of(EstadoEnEspera)
    end
end
