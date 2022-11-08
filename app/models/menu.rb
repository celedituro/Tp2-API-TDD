class Menu
  attr_reader :nombre, :precio
  attr_accessor :id

  def initialize(id, nombre, precio)
    @id = id
    @nombre = nombre
    @precio = precio
    validar_menu!
  end

  def validar_menu!
    raise MenuInvalido, 'menu invalido' if nombre_vacio? || precio_negativo?
  end

  def nombre_vacio?
    (@nombre.nil? || @nombre == '')
  end

  def precio_negativo?
    @precio.negative?
  end
end
