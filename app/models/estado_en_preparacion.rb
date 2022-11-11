class EstadoEnPreparacion
  def actualizar
    EstadoEnCamino.new
  end

  def nombre
    'en preparación'
  end
end
