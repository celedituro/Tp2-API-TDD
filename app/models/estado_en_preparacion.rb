class EstadoEnPreparacion
  def actualizar
    EstadoEnCamino.new
  end

  def nombre
    'en preparación'
  end

  def cancelar
    EstadoCancelado.new
  end
end
