class Pedido
  attr_reader :responsable, :menu, :updated_on, :created_on, :calificacion
  attr_accessor :id, :repartidor

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

  def nombre_menu
    @menu.nombre
  end

  def precio_menu
    @menu.precio
  end

  def id_menu
    @menu.id
  end

  def id_usuario
    @responsable.id
  end

  def actualizar
    @estado = @estado.actualizar
  rescue PedidoYaEntregado
    raise PedidoYaEntregado
  end

  def cancelar
    @estado = @estado.cancelar
  end

  def estado
    @estado.nombre
  end

  def calificar(calificacion)
    @calificacion = calificacion
  end

  def asignar_repartidor(repartidor)
    @repartidor = repartidor
  end

  def nombre_repartidor
    @repartidor.nombre_usuario
  end
end
