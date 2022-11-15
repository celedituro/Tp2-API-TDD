class EstadoRecibido
  def actualizar(_pedido)
    EstadoEnPreparacion.new
  end

  def nombre
    'recibido'
  end

  def cancelar
    EstadoCancelado.new
  end
end
