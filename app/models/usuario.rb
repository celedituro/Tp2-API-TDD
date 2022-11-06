class Usuario
  attr_accessor :nombre, :direccion, :telefono, :updated_on, :created_on

  def initialize(nombre, direccion, telefono)
    @nombre = nombre
    @direccion = direccion
    @telefono = telefono
  end
end
