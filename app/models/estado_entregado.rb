class EstadoEntregado
  def actualizar
    raise PedidoYaEntregado
  end

  def nombre
    'entregado'
  end
end
