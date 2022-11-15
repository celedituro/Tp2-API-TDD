class EstadoCancelado
  def nombre
    'cancelado'
  end

  # TO-DO lanzar excepcion
  def actualizar(_pedido)
    EstadoCancelado.new
  end
end
