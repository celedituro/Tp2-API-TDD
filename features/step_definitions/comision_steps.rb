Dado(/^sin lluvia$/) do
  @fecha = Date.new(2022, 11, 10)
end

Dado(/^con lluvia$/) do
  @fecha = Date.new(2022, 11, 11)
end

Cuando(/^uso el endpoint a "([^"]*)" con \{nombre_usuario: "([^"]*)"\}$/) do |endpoint, nombre_repartidor|
  pedido_repo = Persistence::Repositories::PedidoRepository.new
  pedido = pedido_repo.buscar_por_id(@pedido_id)
  pedido.created_on = @fecha
  pedido_repo.actualizar(pedido)
  @response = Faraday.get("#{BASE_URL}#{endpoint}/#{nombre_repartidor}")
end

Entonces(/^recibo \{id_pedido: (\d+), comision: "([^"]*)"\}$/) do |_id_pedido, comision|
  datos_response = JSON.parse(@response.body)
  expect(datos_response[0]['id_pedido']).to eq(@pedido_id)
  expect(datos_response[0]['comision']).to eq(Float(comision))
end
