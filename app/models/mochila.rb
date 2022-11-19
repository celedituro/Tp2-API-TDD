class Mochila
  CAPACIDAD_MAXIMA = 6
  OCUPACION_MENUES = { 'Menu individual' => 1, 'Menu parejas' => 2, 'Menu familiar' => 4 }.freeze

  attr_reader :capacidad

  def initialize(capacidad = CAPACIDAD_MAXIMA)
    @capacidad = capacidad
  end

  def guardar(menu)
    raise NoHayEspacio unless hay_espacio_para?(menu)

    @capacidad -= OCUPACION_MENUES[menu.nombre]
  end

  private

  def hay_espacio_para?(menu)
    OCUPACION_MENUES[menu.nombre] < @capacidad
  end
end
