Cuando(/^uso el endpoint a "([^"]*)" con id_pedido: (\d+)$/) do |comando, _id_pedido|
  @response = Faraday.patch("#{BASE_URL}#{comando}?id=#{@pedido_id}")
end

When(/^recibo \{id_pedido: (\d+), estado: "([^"]*)"\}$/) do |_id_pedido, estado|
  datos_response = JSON.parse(@response.body)
  expect(datos_response['estado']).to eq(estado)
end
