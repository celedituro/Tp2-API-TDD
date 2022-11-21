require 'spec_helper'

describe ServicioTiempo do

    it 'debe devolver 0 si no llovio en la fecha indicada' do
      fecha = Date.new(2022,11,20)
      api_tiempo = instance_double('servicio_tiempo')
      allow(api_tiempo).to receive(:obtener_factor_tiempo).with(fecha).and_return(0)
    end

    it 'debe devolver 0.01 si llovio en la fecha indicada' do
        fecha = Date.new(2022,11,19)
        mock_servicio_tiempo = instance_double('servicio_tiempo')
        allow(mock_servicio_tiempo).to receive(:obtener_factor_tiempo).with(fecha).and_return(0.01)
    end

    it 'debe devolver fecha_invalida.rb si la diferencia de dias entre la actual y la fecha es mayor a 7' do
      fecha = Date.new(2022,11,13)
      mock_servicio_tiempo = instance_double('servicio_tiempo')
      allow(mock_servicio_tiempo).to receive(:obtener_factor_tiempo).and_raise(FechaInvalida.new)
    end
end
