require 'spec_helper'

describe ComisionesCalculador do

    it 'el resultado debe ser 3 para un menu individual cuando la calificacion es 1 y no llovio' do
        api_tiempo = instance_double('servicio_tiempo')
        pedido = instance_double('pedido')
        menu = instance_double('menu')
        created_on = Date.today

        allow(pedido).to receive(:calificacion).and_return(1)
        allow(pedido).to receive(:created_on).and_return(created_on)
        allow(pedido).to receive(:menu).and_return(menu)
        allow(menu).to receive(:precio).and_return(100)
        allow(api_tiempo).to receive(:obtener_factor_tiempo).with(created_on).and_return(0)

        comision_calculador = described_class.new(api_tiempo)
        comision = comision_calculador.calcular(pedido)
        expect(comision).to eq(3.0)
    end

    it 'el resultado debe ser 5 para un menu individual cuando la calificacion es 2 y no llovio' do
        api_tiempo = instance_double('servicio_tiempo')
        pedido = instance_double('pedido')
        menu = instance_double('menu')
        created_on = Date.today
        
        allow(pedido).to receive(:calificacion).and_return(2)
        allow(pedido).to receive(:created_on).and_return(created_on)
        allow(pedido).to receive(:menu).and_return(menu)
        allow(menu).to receive(:precio).and_return(100)
        allow(api_tiempo).to receive(:obtener_factor_tiempo).with(created_on).and_return(0)

        comision_calculador = described_class.new(api_tiempo)
        comision = comision_calculador.calcular(pedido)
        expect(comision).to eq(5.0)
    end

    it 'el resultado debe ser 7 para un menu individual cuando la calificacion es 5 y no llovio' do
      api_tiempo = instance_double('servicio_tiempo')
      pedido = instance_double('pedido')
      menu = instance_double('menu')
      created_on = Date.today

      allow(pedido).to receive(:calificacion).and_return(5)
      allow(pedido).to receive(:created_on).and_return(created_on)
      allow(pedido).to receive(:menu).and_return(menu)
      allow(menu).to receive(:precio).and_return(100)
      allow(api_tiempo).to receive(:obtener_factor_tiempo).with(created_on).and_return(0)

      comision_calculador = described_class.new(api_tiempo)
      comision = comision_calculador.calcular(pedido)
      expect(comision).to eq(7.0)
    end

    it 'el resultado debe ser 5 para un menu individual cuando la calificacion es 3 y no llovio' do
      api_tiempo = instance_double('servicio_tiempo')
      pedido = instance_double('pedido')
      menu = instance_double('menu')
      created_on = Date.today

      allow(pedido).to receive(:calificacion).and_return(3)
      allow(pedido).to receive(:created_on).and_return(created_on)
      allow(pedido).to receive(:menu).and_return(menu)
      allow(menu).to receive(:precio).and_return(100)
      allow(api_tiempo).to receive(:obtener_factor_tiempo).with(created_on).and_return(0)

      comision_calculador = described_class.new(api_tiempo)
      comision = comision_calculador.calcular(pedido)
      expect(comision).to eq(5.0)
    end

    it 'el resultado debe ser 5 para un menu individual cuando la calificacion es 4 y no llovio' do
      api_tiempo = instance_double('servicio_tiempo')
      pedido = instance_double('pedido')
      menu = instance_double('menu')
      created_on = Date.today

      allow(pedido).to receive(:calificacion).and_return(4)
      allow(pedido).to receive(:created_on).and_return(created_on)
      allow(pedido).to receive(:menu).and_return(menu)
      allow(menu).to receive(:precio).and_return(100)
      allow(api_tiempo).to receive(:obtener_factor_tiempo).with(created_on).and_return(0)

      comision_calculador = described_class.new(api_tiempo)
      comision = comision_calculador.calcular(pedido)
      expect(comision).to eq(5.0)
    end

    it 'el resultado debe ser 6 para un menu individual cuando la calificacion es 4 y llovio' do
      api_tiempo = instance_double('servicio_tiempo')
      pedido = instance_double('pedido')
      menu = instance_double('menu')
      created_on = Date.today

      allow(pedido).to receive(:calificacion).and_return(4)
      allow(pedido).to receive(:created_on).and_return(created_on)
      allow(pedido).to receive(:menu).and_return(menu)
      allow(menu).to receive(:precio).and_return(100)
      allow(api_tiempo).to receive(:obtener_factor_tiempo).with(created_on).and_return(0.01)

      comision_calculador = described_class.new(api_tiempo)
      comision = comision_calculador.calcular(pedido)
      expect(comision).to eq(6.0)
    end

    it 'el resultado debe ser 7 para un menu individual cuando la calificacion es 5 y llovio' do
      api_tiempo = instance_double('servicio_tiempo')
      pedido = instance_double('pedido')
      menu = instance_double('menu')
      created_on = Date.today

      allow(pedido).to receive(:calificacion).and_return(5)
      allow(pedido).to receive(:created_on).and_return(created_on)
      allow(pedido).to receive(:menu).and_return(menu)
      allow(menu).to receive(:precio).and_return(100)
      allow(api_tiempo).to receive(:obtener_factor_tiempo).with(created_on).and_return(0.01)

      comision_calculador = described_class.new(api_tiempo)
      comision = comision_calculador.calcular(pedido)
      expect(comision).to eq(8.0)
    end

    it 'el resultado debe ser 3 para un menu individual cuando la calificacion es 1 y llovio' do
      api_tiempo = instance_double('servicio_tiempo')
      pedido = instance_double('pedido')
      menu = instance_double('menu')
      created_on = Date.today

      allow(pedido).to receive(:calificacion).and_return(1)
      allow(pedido).to receive(:created_on).and_return(created_on)
      allow(pedido).to receive(:menu).and_return(menu)
      allow(menu).to receive(:precio).and_return(100)
      allow(api_tiempo).to receive(:obtener_factor_tiempo).with(created_on).and_return(0.01)

      comision_calculador = described_class.new(api_tiempo)
      comision = comision_calculador.calcular(pedido)
      expect(comision).to eq(4.0)
    end

    it 'el resultado debe ser 5 para un menu familiar cuando la calificacion es 3 y no llovio' do
      api_tiempo = instance_double('servicio_tiempo')
      pedido = instance_double('pedido')
      menu = instance_double('menu')
      created_on = Date.today

      allow(pedido).to receive(:calificacion).and_return(3)
      allow(pedido).to receive(:created_on).and_return(created_on)
      allow(pedido).to receive(:menu).and_return(menu)
      allow(menu).to receive(:precio).and_return(175)
      allow(api_tiempo).to receive(:obtener_factor_tiempo).with(created_on).and_return(0)

      comision_calculador = described_class.new(api_tiempo)
      comision = comision_calculador.calcular(pedido)
      expect(comision).to eq(8.75)
    end
end
