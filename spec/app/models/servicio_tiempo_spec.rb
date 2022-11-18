require 'spec_helper'

describe ServicioTiempo do

    it 'debe devolver 0 si no llovio el en la fecha indicada' do
        fecha = Date.new(2022,11,10)
        servicio_tiempo = described_class.new()
        expect(servicio_tiempo.obtener_tiempo(fecha)).to eq(0)
    end

    it 'debe devolver 0.01 si llovio el en la fecha indicada' do
        fecha = Date.new(2022,11,11)
        servicio_tiempo = described_class.new()
        expect(servicio_tiempo.obtener_tiempo(fecha)).to eq(0.01)
    end

end
