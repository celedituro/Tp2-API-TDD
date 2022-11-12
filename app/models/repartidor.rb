class Repartidor
  attr_accessor :nombre_usuario, :nombre

  def initialize(nombre_usuario, nombre)
    @nombre_usuario = nombre_usuario
    @nombre = nombre

    validar_repartidor!
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
end
