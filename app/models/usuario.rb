class Usuario
  attr_accessor :nombre, :direccion, :telefono, :updated_on, :created_on, :id

  def initialize(nombre, direccion, telefono, id)
    @nombre = nombre
    @direccion = direccion
    @telefono = telefono
    @id = id
    validar_usuario!
  end

  def validar_usuario!
    raise UsuarioInvalido, 'usuario invalido' if nombre_vacio? || direccion_vacia? || telefono_vacio? || id_vacio?
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

  def id_vacio?
    (@id.nil? || @id == '')
  end
end
