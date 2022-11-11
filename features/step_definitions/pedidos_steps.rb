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
