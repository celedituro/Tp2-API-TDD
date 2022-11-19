class EstadoCancelado
  def intentar_calificar(pedido, calificacion)
    pedido.calificar_pedido(calificacion)
  end

  def nombre
    'cancelado'
  end

  # TO-DO lanzar excepcion
  def actualizar(_pedido)
    EstadoCancelado.new
  end
end
