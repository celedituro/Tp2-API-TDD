class EstadoEnPreparacion
  def actualizar(pedido)
    pedido.asignar_repartidor(BuscadorRepartidores.new)
    EstadoEnCamino.new
  rescue NoHayRepartidoresLibres
    EstadoEnEspera.new
  end

  def intentar_calificar(_pedido, _calificacion)
    raise CalificacionInvalida
  end

  def nombre
    'en preparación'
  end

  def cancelar
    EstadoCancelado.new
  end
end
