class UsuarioCreator
  def initialize(usuario_repository)
    @repository = usuario_repository
  end

  def crear_usuario(nombre, direccion, telefono, id)
    usuario = Usuario.new(nombre, direccion, telefono, id)
    @repository.guardar(usuario)
  rescue Duplicado
    raise Duplicado
  end
end
