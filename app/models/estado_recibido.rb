class EstadoRecibido
  def actualizar
    EstadoEnPreparacion.new
  end

  def nombre
    'recibido'
  end

  def cancelar
    EstadoCancelado.new
  end
end
