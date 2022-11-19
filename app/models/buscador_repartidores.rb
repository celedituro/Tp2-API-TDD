class BuscadorRepartidores
  def buscar(pedido)
    repartidor_repository = Persistence::Repositories::RepartidorRepository.new
    repartidores = repartidor_repository.buscar_repartidores_libres
    raise NoHayRepartidoresLibres if repartidores.empty?

    begin
      guardar_en_mochila(pedido, repartidores, repartidor_repository)
    rescue StandardError => e
      raise e
    end
  end

  # TODO: - Revisar funcion y ver como refactorizarla.
  def guardar_en_mochila(pedido, repartidores, repartidor_repository)
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
