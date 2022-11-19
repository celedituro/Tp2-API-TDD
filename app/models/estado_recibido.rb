class EstadoRecibido
  def actualizar(_pedido)
    EstadoEnPreparacion.new
  end
  def intentar_calificar(_pedido, _calificacion)
    raise CalificacionInvalida
  end
  def nombre
    'recibido'
  end

  def cancelar
    EstadoCancelado.new
  end
end
