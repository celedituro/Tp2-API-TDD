class PedidoCreator
  def initialize(pedido_repository, usuario_repository, menus_repository)
    @pedido_repo = pedido_repository
    @usuario_repo = usuario_repository
    @menu_repo = menus_repository
  end

  def crear_pedido(id_usuario, id_menu)
    usuario = @usuario_repo.buscar_por_id(id_usuario)
    menu = @menu_repo.buscar_por_id(id_menu)
    pedido = Pedido.new(usuario, menu, EstadoRecibido.new)
    @pedido_repo.guardar(pedido)
  rescue ObjectNotFound => e
    raise UsuarioNoRegistrado if e.model == 'Usuario'
    raise MenuInvalido if e.model == 'Menu'
  end
end
