module Persistence
  module Repositories
    class UsuarioRepository < BaseRepository
      self.table_name = :usuarios
      self.model_class = 'Usuario'

      def buscar_por_id(id)
        found_record = dataset.first(id_column => id)
        raise ObjectNotFound.new(self.class.model_class, id) if found_record.nil?

        cargar_objeto dataset.first(found_record)
      end

      def actualizar(un_registro)
        buscar_dataset_por_id(un_registro.telefono).update(actualizar_changeset(un_registro))
      end

      protected

      def insertar(un_registro)
        id = dataset.insert(insertar_changeset(un_registro))
        un_registro.telefono = id
        un_registro
      rescue Sequel::UniqueConstraintViolation
        raise Duplicado
      end

      def cargar_objeto(a_hash)
        Usuario.new(a_hash[:nombre], a_hash[:direccion], a_hash[:telefono], a_hash[:id])
      end

      def changeset(usuario)
        {
          nombre: usuario.nombre,
          direccion: usuario.direccion,
          telefono: usuario.telefono,
          id: usuario.id
        }
      end

      def pk_column
        Sequel[self.class.table_name][:telefono]
      end
    end
  end
end
