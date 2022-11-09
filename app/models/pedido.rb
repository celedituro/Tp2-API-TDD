class Pedido
  # attr_accessor :nombre, :direccion, :telefono, :updated_on, :created_on

  def initialize(responsable, menu)
    @responsable = responsable
    @menu = menu
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
end
