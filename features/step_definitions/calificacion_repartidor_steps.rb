When(/^uso el endpoint a "([^"]*)" con \{id_usuario: "([^"]*)" , id_pedido: (\d+), calificacion: (\d+)\}$/) do |comando, id_usuario, _id_pedido, calificacion|
  @comando = comando
  @request = {id_usuario: id_usuario, id_pedido: @pedido_id, calificacion: calificacion}.to_json
  @response = Faraday.patch("#{BASE_URL}#{@comando}", @request, header)
end

When(/^recibo \{id_pedido: (\d+), calificacion: (\d+)\}$/) do |_id_pedido, calificacion|
  datos_response = JSON.parse(@response.body)
  expect(datos_response['id_pedido']).to eq(@pedido_id)
  expect(datos_response['calificacion']).to eq(calificacion)
end

When(/^uso el endpoint a "([^"]*)" con \{id_usuario: "([^"]*)" , id_pedido: (\d+)\}$/) do |comando, id_usuario, _id_pedido|
  @comando = comando
  @request = {id_usuario: id_usuario, id_pedido: @pedido_id}.to_json
  @response = Faraday.patch("#{BASE_URL}#{@comando}", @request, header)
end
