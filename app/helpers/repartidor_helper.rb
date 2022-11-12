# Helper methods defined here can be accessed in any controller or view in the application

module WebTemplate
  class App
    module RepartidorHelper
      def repartidor_repository
        Persistence::Repositories::RepartidorRepository.new
      end
    end
    helpers RepartidorHelper
  end
end
