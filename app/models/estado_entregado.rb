class EstadoEntregado
  def actualizar(_pedido)
    raise PedidoYaEntregado
  end

  def intentar_calificar(pedido, calificacion)
    pedido.calificar_pedido(calificacion)
  rescue CalificacionRangoInvalido
    raise CalificacionRangoInvalido
  end

  def nombre
    'entregado'
  end

  def cancelar
    raise CancelarPedidoError
  end
end
