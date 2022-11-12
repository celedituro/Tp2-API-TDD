class EstadoEntregado
  def actualizar
    raise PedidoYaEntregado
  end

  def nombre
    'entregado'
  end

  # TO-DO lanzar excepcion
  def cancelar
    EstadoCancelado.new
  end
end
