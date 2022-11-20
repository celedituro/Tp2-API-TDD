class Pedido
  attr_reader :responsable, :menu, :updated_on
  attr_accessor :id, :repartidor, :created_on, :calificacion

  RANGO_CALIFICACION_VALIDO = (1..5).freeze

  def initialize(responsable, menu, estado)
    @responsable = responsable
    @menu = menu
    @estado = estado
    @calificacion = nil
    @repartidor = nil
    validar_pedido!
  end

  def validar_pedido!
    raise PedidoInvalido, 'pedido invalido' if responsable_vacio? || menu_vacio?
  end

  def responsable_vacio?
    (@responsable.nil? || @responsable == '')
  end

  def menu_vacio?
    (@menu.nil? || @menu == '')
  end

  def actualizar
    @estado = @estado.actualizar(self)
  rescue PedidoYaEntregado
    raise PedidoYaEntregado
  end

  def cancelar
    @estado = @estado.cancelar
  end

  def estado
    @estado.nombre
  end

  def calificar_pedido(calificacion)
    raise CalificacionRangoInvalido unless RANGO_CALIFICACION_VALIDO.include?(calificacion)

    @calificacion = calificacion
  end

  def calificar(calificacion)
    @estado.intentar_calificar(self, calificacion)
  rescue CalificacionInvalida
    raise CalificacionInvalida
  rescue CalificacionRangoInvalido
    raise CalificacionRangoInvalido
  end

  # TODO: refactor/consultar
  def asignar_repartidor(buscador)
    repartidor = buscador.buscar(self)
    @repartidor = repartidor
  rescue NoHayRepartidoresLibres
    raise NoHayRepartidoresLibres
  end
end
