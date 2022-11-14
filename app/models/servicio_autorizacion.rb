class Autorizacion
  def initialize(usuario_repository)
    @usuario_repository = usuario_repository
  end

  def autorizar(id)
    usuario = @usuario_repository.buscar_por_id(id)
  rescue ObjectNotFound
    raise UsuarioNoRegistrado.new, 'usuario no registrado'
  end
end
