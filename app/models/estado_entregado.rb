class EstadoEntregado
  def actualizar(_pedido)
    raise PedidoYaEntregado
  end

  def intentar_calificar(pedido, calificacion)
    pedido.calificar_pedido(calificacion)
  end
  def nombre
    'entregado'
  end

  # TO-DO lanzar excepcion
  def cancelar
    EstadoCancelado.new
  end
end
