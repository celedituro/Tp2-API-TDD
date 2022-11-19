class EstadoEnCamino
  def actualizar(_pedido)
    EstadoEntregado.new
  end

  def intentar_calificar(_pedido, _calificacion)
    raise CalificacionInvalida
  end

  def nombre
    'en camino'
  end

  # TO-DO lanzar excepcion
  def cancelar
    EstadoCancelado.new
  end
end
