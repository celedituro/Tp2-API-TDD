class EstadoCancelado
  def intentar_calificar(pedido, calificacion)
    pedido.calificar_pedido(calificacion)
  rescue CalificacionRangoInvalido
    raise CalificacionRangoInvalido
  end

  def nombre
    'cancelado'
  end

  # TODO: lanzar excepcion
  def cancelar
    EstadoCancelado.new
  end

  # TODO: lanzar excepcion
  def actualizar(_pedido)
    EstadoCancelado.new
  end
end
