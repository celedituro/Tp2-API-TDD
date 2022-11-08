module Persistence
  module Repositories
    class UsuarioRepository < BaseRepository
      self.table_name = :usuarios
      self.model_class = 'Usuario'

      protected

      def insertar(un_registro)
        id = dataset.insert(insertar_changeset(un_registro))
        un_registro.telefono = id
        un_registro
      rescue Sequel::UniqueConstraintViolation
        raise Duplicado
      end

      def cargar_objeto(a_hash)
        Usuario.new(a_hash[:nombre], a_hash[:direccion], a_hash[:telefono])
      end

      def changeset(usuario)
        {
          nombre: usuario.nombre,
          direccion: usuario.direccion,
          telefono: usuario.telefono
        }
      end
    end
  end
end
