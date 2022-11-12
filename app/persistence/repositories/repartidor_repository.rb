module Persistence
  module Repositories
    class RepartidorRepository < BaseRepository
      self.table_name = :repartidor
      self.model_class = 'Repartidor'

      protected

      def cargar_objeto(a_hash)
        Repartidor.new(a_hash[:nombre_usuario], a_hash[:nombre])
      end

      def changeset(repartidor)
        {
          nombre_usuario: repartidor.nombre_usuario,
          nombre: repartidor.nombre
        }
      end
    end
  end
end
