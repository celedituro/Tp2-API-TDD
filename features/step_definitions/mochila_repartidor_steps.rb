When(/^la capacidad de la mochila es (\d+) para "([^"]*)"$/) do |capacidad, nombre_usuario|
  @repartidor_repository = Persistence::Repositories::RepartidorRepository.new
  repartidor = @repartidor_repository.buscar_por_id(nombre_usuario)
  expect(repartidor.mochila.capacidad).to eq(capacidad)
end

When(/^la capacidad libre de la mochila es (\d+) para "([^"]*)"$/) do |capacidad, nombre_usuario|
  repartidor = @repartidor_repository.buscar_por_id(nombre_usuario)
  expect(repartidor.mochila.capacidad).to eq(capacidad)
end
