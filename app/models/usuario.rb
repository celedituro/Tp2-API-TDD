class Usuario
  attr_accessor :nombre, :direccion, :telefono, :updated_on, :created_on

  def initialize(nombre, direccion, telefono)
    @nombre = nombre
    @direccion = direccion
    @telefono = telefono
    validar_usuario!
  end

  def validar_usuario!
    raise UsuarioInvalido, 'usuario invalido' if nombre_vacio? || direccion_vacia? || telefono_vacio?
  end

  def nombre_vacio?
    (@nombre.nil? || @nombre == '')
  end

  def direccion_vacia?
    (@direccion.nil? || @direccion == '')
  end

  def telefono_vacio?
    (@telefono.nil? || @telefono == '')
  end
end
