class BuscadorRepartidores
  def buscar
    repartidor_repository = Persistence::Repositories::RepartidorRepository.new
    repartidores = repartidor_repository.buscar_repartidores_libres
    return if repartidores.empty?

    repartidor = repartidores[0]
    repartidor.esta_ocupado

    repartidor_repository.actualizar(repartidor)
    repartidor
  end
end
