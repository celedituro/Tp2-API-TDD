require 'byebug'

module Persistence
  module Repositories
    class BaseRepository
      def guardar(un_registro)
        insertar(un_registro)
        un_registro
      rescue Duplicado
        raise Duplicado
      end

      def primer_registro
        cargar_coleccion dataset
        cargar_objeto dataset.first
      end

      def eliminar_todos
        dataset.delete
      end

      class << self
        attr_accessor :table_name, :model_class
      end

      def obtener_todos
        cargar_coleccion dataset.all
      end

      protected

      def dataset
        DB[self.class.table_name]
      end

      def cargar_coleccion(rows)
        rows.map { |un_registro| cargar_objeto(un_registro) }
      end

      def actualizar(un_registro)
        buscar_dataset_por_id(un_registro.telefono).update(actualizar_changeset(un_registro))
      end

      def insertar(un_registro)
        id = dataset.insert(insertar_changeset(un_registro))
        un_registro.id = id
        un_registro
      end

      def buscar_dataset_por_id(id)
        dataset.where(pk_column => id)
      end

      def cargar_objeto(_un_registro)
        raise 'Subclass must implement'
      end

      def changeset(_un_registro)
        raise 'Subclass must implement'
      end

      def insertar_changeset(un_registro)
        changeset_with_timestamps(un_registro).merge(created_on: Date.today)
      end

      def actualizar_changeset(un_registro)
        changeset_with_timestamps(un_registro).merge(updated_on: Date.today)
      end

      def changeset_with_timestamps(un_registro)
        changeset(un_registro).merge(created_on: un_registro.created_on, updated_on: un_registro.updated_on)
      end

      def class_name
        self.class.model_class
      end

      def pk_column
        Sequel[self.class.table_name][:telefono]
      end
    end
  end
end
