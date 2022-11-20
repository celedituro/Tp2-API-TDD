class EstadoEnEspera
  def nombre
    'en espera'
  end

  def actualizar(pedido)
    pedido.asignar_repartidor(BuscadorRepartidores.new)
    EstadoEnCamino.new
  rescue NoHayRepartidoresLibres
    EstadoEnEspera.new
  end

  def cancelar
    raise CancelarPedidoError
  end
end
