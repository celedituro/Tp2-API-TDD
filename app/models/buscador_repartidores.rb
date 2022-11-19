class BuscadorRepartidores
  def buscar(pedido)
    repartidor_repository = Persistence::Repositories::RepartidorRepository.new
    repartidores = repartidor_repository.buscar_repartidores_libres
    raise NoHayRepartidoresLibres if repartidores.empty?

    i = 0
    repartidor = nil
    pedido_guardado = nil
    until !pedido_guardado.nil? || i >= repartidores.length
      begin
        pedido_guardado = repartidores[i].guardar(pedido)
        repartidor = repartidores[i]
      rescue NoHayEspacio
        repartidores[i].esta_ocupado
        repartidor = repartidores[i]
        pedido_guardado = nil
        i += 1
      end
    end
    repartidor_repository.actualizar(repartidor)
    raise NoHayRepartidoresLibres if pedido_guardado.nil?

    repartidor
  end
end
