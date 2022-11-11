Cuando(/^uso el endpoint "([^"]*)" para consultar el estado del pedido$/) do |comando|
  @response = Faraday.get("#{BASE_URL}#{comando}/#{@pedido_id}")
end

Entonces(/^recibo \{nombre_menu: "([^"]*)", id_pedido: (\d+), estado: "([^"]*)"\}$/) do |menu, _id_pedido, estado|
  datos_response = JSON.parse(@response.body)
  expect(datos_response['nombre_menu']).to eq(menu)
  expect(datos_response['estado']).to eq(estado)
  expect(datos_response['id_pedido']).to eq(@pedido_id)
end
