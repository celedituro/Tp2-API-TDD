class UsuarioCreator
  def initialize(usuario_repository)
    @repository = usuario_repository
  end

  def crear_usuario(nombre, direccion, telefono)
    usuario = Usuario.new(nombre, direccion, telefono)
    @repository.guardar(usuario)
  rescue Duplicado
    raise Duplicado
  end
end
