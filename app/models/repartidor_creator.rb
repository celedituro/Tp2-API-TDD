class RepartidorCreator
  def initialize(repartidor_repository)
    @repository = repartidor_repository
  end

  def crear_repartidor(nombre_usuario, nombre)
    repartidor = Repartidor.new(nombre_usuario, nombre)
    @repository.guardar(repartidor)
  end
end
