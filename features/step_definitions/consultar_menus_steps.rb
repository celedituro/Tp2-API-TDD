Dado(/^que soy un usuario registrado$/) do
  @request = {nombre: 'pepe', direccion: 'pepe direccion', telefono: '123-567'}.to_json
  @response = Faraday.post(crear_usuario_url, @request, header)
end

Cuando(/^realizo un GET a "([^"]*)"$/) do |comando|
  @response = Faraday.get("#{BASE_URL}#{comando}")
end

def menus_esperados(reponse, idx, id_esperado, nombre_esperado, precio_esperado)
  expect(reponse[idx]['id']).to eq(id_esperado)
  expect(reponse[idx]['nombre']).to eq(nombre_esperado)
  expect(reponse[idx]['precio']).to eq(precio_esperado)
end

# rubocop: disable Metrics/ParameterLists
Entonces(/^recibo \[\{id:(\d*), nombre:"([^"]*)", precio: (\d*)\},\{id:(\d*), nombre:"([^"]*)", precio: (\d*)\},\{id:(\d*), nombre:"([^"]*)", precio: (\d*)\}\] como response$/) do
|id1, nombre1, precio1, id2, nombre2, precio2, id3, nombre3, precio3|
  datos_response = JSON.parse(@response.body)
  menus_esperados(datos_response, 0, Integer(id1), nombre1, Integer(precio1))
  menus_esperados(datos_response, 1, Integer(id2), nombre2, Integer(precio2))
  menus_esperados(datos_response, 2, Integer(id3), nombre3, Integer(precio3))
end
# rubocop: enable Metrics/ParameterLists
