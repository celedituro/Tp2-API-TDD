class UsuarioCreator
  def initialize(usuario_repository)
    @repository = usuario_repository
  end

  def crear_usuario(nombre, direccion, telefono)
    begin
      usuario = Usuario.new(nombre, direccion, telefono)
      @repository.guardar(usuario)
    rescue UsuarioDuplicado
      raise UsuarioDuplicado
    end
  end
end
