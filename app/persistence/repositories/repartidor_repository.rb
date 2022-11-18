module Persistence
  module Repositories
    class RepartidorRepository < BaseRepository
      self.table_name = :repartidores
      self.model_class = 'Repartidor'

      def buscar_repartidores_libres
        cargar_coleccion dataset.where(esta_libre_repartidor_column => true)
      end

      def esta_libre_repartidor_column
        Sequel[self.class.table_name][:esta_libre]
      end

      def actualizar(un_registro)
        buscar_dataset_por_id(un_registro.nombre_usuario).update(actualizar_changeset(un_registro))
      end

      def pk_column
        Sequel[self.class.table_name][:nombre_usuario]
      end

      protected

      def cargar_objeto(a_hash)
        repartidor = Repartidor.new(a_hash[:nombre_usuario], a_hash[:nombre])
        repartidor.esta_libre = a_hash[:esta_libre]
        repartidor
      end

      def changeset(repartidor)
        {
          nombre_usuario: repartidor.nombre_usuario,
          nombre: repartidor.nombre,
          esta_libre: repartidor.esta_libre
        }
      end
    end
  end
end
