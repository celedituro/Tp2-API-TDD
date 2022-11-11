class Pedido
  attr_reader :responsable, :menu, :updated_on, :created_on, :estado
  attr_accessor :id

  def initialize(responsable, menu)
    @responsable = responsable
    @menu = menu
    @estado = 'recibido'
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

  def id_menu
    @menu.id
  end

  def id_usuario
    @responsable.id
  end
end
