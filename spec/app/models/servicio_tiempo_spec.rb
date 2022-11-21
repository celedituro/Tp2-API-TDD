require 'spec_helper'

describe ServicioTiempo do

    it 'debe devolver 0 si no llovio en la fecha indicada' do
      fecha = Date.new(2022,11,20)
      mock_servicio_tiempo = instance_double('servicio_tiempo')
      allow(mock_servicio_tiempo).to receive(:obtener_factor_tiempo).with(fecha).and_return(0)
    end

    it 'debe devolver 0.01 si llovio en la fecha indicada' do
        fecha = Date.new(2022,11,19)
        mock_servicio_tiempo = instance_double('servicio_tiempo')
        allow(mock_servicio_tiempo).to receive(:obtener_factor_tiempo).with(fecha).and_return(0.01)
    end
end
