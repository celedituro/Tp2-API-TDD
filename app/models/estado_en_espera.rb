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
end
