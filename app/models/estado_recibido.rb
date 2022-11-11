class EstadoRecibido
  def actualizar
    EstadoEnPreparacion.new
  end

  def nombre
    'recibido'
  end
end
