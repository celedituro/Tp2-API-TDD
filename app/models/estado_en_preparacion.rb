class EstadoEnPreparacion
  def actualizar(pedido)
    pedido.asignar_repartidor(BuscadorRepartidores.new)
    EstadoEnCamino.new
  end

  def nombre
    'en preparación'
  end

  def cancelar
    EstadoCancelado.new
  end
end
