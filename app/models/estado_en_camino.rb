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

  def cancelar
    raise CancelarPedidoError
  end
end
