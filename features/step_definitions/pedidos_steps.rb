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

Cuando(/^uso el endpoint "([^"]*)"$/) do |_comando|
  pending
end

Entonces(/^recibo \[\{id_pedido:1, id:1, nombre:"([^"]*)", precio:100, estado:"([^"]*)"\},\{id_pedido:2, id:1, nombre:"([^"]*)", precio:100, estado:"([^"]*)"\},\{id_pedido:4, id:3, nombre:"([^"]*)", precio:250, estado:"([^"]*)"\}\] como response$/) do |_arg1, _arg2, _arg3, _arg4, _arg5, _arg6, _arg7, _arg8, _arg9, _arg10, _arg11, _arg12, _arg13, _arg14, _arg15|
  pending
end
