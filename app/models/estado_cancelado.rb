class EstadoCancelado
  def nombre
    'cancelado'
  end

  # TO-DO lanzar excepcion
  def actualizar
    EstadoCancelado.new
  end
end
