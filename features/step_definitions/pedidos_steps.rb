Dado(/^que soy un usuario registrado con id_usuario: "([^"]*)"$/) do |id_usuario|
  @request = {nombre: 'pepe', direccion: 'pepe direccion', telefono: '123-567', id: id_usuario}.to_json
  @response = Faraday.post(crear_usuario_url, @request, header)
end

Cuando(/^uso el endpoint a "([^"]*)" con \{id_usuario: "([^"]*)" , id_menu: (\d+) \}$/) do |comando, id_usuario, id_menu|
  @comando = comando
  @request = {id_usuario: id_usuario, id_menu: id_menu}.to_json
end

Entonces('se crea un nuevo pedido') do
  @response = Faraday.post("#{BASE_URL}#{@comando}", @request, header)
end

Entonces(/^recibo con nombre_menu: "([^"]*)"$/) do |nombre_menu|
  datos_response = JSON.parse(@response.body)
  expect(datos_response['nombre_menu']).to eq(nombre_menu)
end

Dado(/^que el estado del pedido es "([^"]*)"$/) do |estado|
  @response = Faraday.get("#{BASE_URL}/pedido/#{@pedido_id}", @request, header)
  datos_response = JSON.parse(@response.body)
  expect(datos_response['estado']).to eq(estado)
end

Dado(/^creo un pedido con menu individual$/) do
  @request = {id_usuario: '1', id_menu: 1}.to_json
  @response = Faraday.post("#{BASE_URL}/pedido", @request, header)
  @pedido_id = JSON.parse(@response.body)['id']
end

Cuando(/^cambio el estado del pedido$/) do
  @response = Faraday.patch("#{BASE_URL}/pedido", {id: @pedido_id}, header)
end

Cuando(/^pregunto por el estado del pedido$/) do
  pending # Write code here that turns the phrase above into concrete actions
end

Entonces(/^el estado es "([^"]*)"$/) do |_estado|
  pending # Write code here that turns the phrase above into concrete actions
end

Dado(/^se termina de preparar un pedido$/) do
  pending
end

Cuando(/^hay repartidores libres$/) do
  pending
end

Entonces(/^el estado es “En camino”$/) do
  pending
end

Dado(/^se entrega un pedido$/) do
  pending
end
