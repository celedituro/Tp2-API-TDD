class EstadoFactory
  def initialize
    @estados = {'recibido' => EstadoRecibido.new.clone,
                'en preparación' => EstadoEnPreparacion.new.clone,
                'en camino' => EstadoEnCamino.new.clone,
                'entregado' => EstadoEntregado.new.clone,
                'cancelado' => EstadoCancelado.new.clone
    }
  end

  def get_estado(estado)
    @estados[estado]
  end
end
