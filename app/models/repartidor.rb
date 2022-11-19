class Repartidor
  attr_accessor :nombre_usuario, :nombre, :created_on, :updated_on, :id, :esta_libre, :mochila

  def initialize(nombre_usuario, nombre)
    @nombre_usuario = nombre_usuario
    @nombre = nombre
    @esta_libre = true
    @mochila = Mochila.new
    validar_repartidor!
  end

  def guardar(pedido)
    @mochila.guardar(pedido.menu)
    pedido
  rescue NoHayEspacio
    raise NoHayEspacio
  end

  def validar_repartidor!
    raise RepartidorInvalido, 'repartidor invalido' if nombre_usuario_vacio? || nombre_vacio?
  end

  def nombre_vacio?
    (@nombre.nil? || @nombre == '')
  end

  def nombre_usuario_vacio?
    (@nombre_usuario.nil? || @nombre_usuario == '')
  end

  def esta_ocupado
    @esta_libre = false
  end
end
