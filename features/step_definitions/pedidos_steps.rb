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
  @response = Faraday.get("#{BASE_URL}/pedido/#{@pedido_id}")
  datos_response = JSON.parse(@response.body)
  expect(datos_response['estado']).to eq(estado)
end

Dado(/^creo un pedido con menu individual$/) do
  @request = {id_usuario: '1', id_menu: 1}.to_json
  @response = Faraday.post("#{BASE_URL}/pedido", @request, header)
  @pedido_id = JSON.parse(@response.body)['id_pedido']
end

Cuando(/^cambio el estado del pedido$/) do
  @response = Faraday.patch("#{BASE_URL}/pedido?id=#{@pedido_id}")
end

Cuando(/^pregunto por el estado del pedido$/) do
  @response = Faraday.get("#{BASE_URL}/pedido/#{@pedido_id}")
end

Entonces(/^el estado es "([^"]*)"$/) do |estado|
  datos_response = JSON.parse(@response.body)
  expect(datos_response['estado']).to eq(estado)
end

Cuando(/^uso el endpoint "([^"]*)"$/) do |enpoint|
  @response = Faraday.get("#{BASE_URL}#{enpoint}")
end

# rubocop: disable Metrics/ParameterLists, Layout/LineLength, Metrics/AbcSize
def pedidos_esperados(reponse, idx, _id_pedido_esperado, id_menu_esperado, nombre_esperado, precio_esperado, estado_esperado)
  expect(reponse[idx]['id_menu']).to eq(id_menu_esperado)
  expect(reponse[idx]['nombre_menu']).to eq(nombre_esperado)
  expect(reponse[idx]['precio']).to eq(precio_esperado)
  expect(reponse[idx]['estado']).to eq(estado_esperado)
end

Entonces(/^recibo \[\{id_pedido: (\d+), id: (\d+), nombre:"([^"]*)", precio: (\d+), estado:"([^"]*)"\},\{id_pedido: (\d+), id: (\d+), nombre:"([^"]*)", precio: (\d+), estado:"([^"]*)"\},\{id_pedido: (\d+), id: (\d+), nombre:"([^"]*)", precio: (\d+), estado:"([^"]*)"\}\] como response$/) do |id_pedido1, id_menu1, nombre1, precio1, estado1, id_pedido2, id_menu2, nombre2, precio2, estado2, id_pedido3, id_menu3, nombre3, precio3, estado3|
  datos_response = JSON.parse(@response.body)
  pedidos_esperados(datos_response, 0, Integer(id_pedido1), Integer(id_menu1), nombre1, Integer(precio1), estado1)
  pedidos_esperados(datos_response, 1, Integer(id_pedido2), Integer(id_menu2), nombre2, Integer(precio2), estado2)
  pedidos_esperados(datos_response, 2, Integer(id_pedido3), Integer(id_menu3), nombre3, Integer(precio3), estado3)
end
# rubocop: enable Metrics/ParameterLists, Layout/LineLength, Metrics/AbcSize
