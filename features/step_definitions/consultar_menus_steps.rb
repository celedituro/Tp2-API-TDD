Dado(/^que soy un usuario registrado$/) do
  @request = {nombre: 'pepe', direccion: 'pepe direccion', telefono: '123-567'}.to_json
  @response = Faraday.post(crear_usuario_url, @request, header)
end

Cuando(/^realizo un GET a "([^"]*)"$/) do |comando|
  p "#{BASE_URL}#{comando}"
  @response = Faraday.get("#{BASE_URL}#{comando}")
end

def menus_esperados(reponse, idx, id_esperado, nombre_esperado, precio_esperado)
  expect(reponse[idx]['id']).to eq(id_esperado)
  expect(reponse[idx]['nombre']).to eq(nombre_esperado)
  expect(reponse[idx]['precio']).to eq(precio_esperado)
end

Entonces(/^recibo \[\{id:(\d*), nombre:"([^"]*)", precio: (\d*)\},\{id:(\d*), nombre:"([^"]*)", precio: (\d*)\},\{id:(\d*), nombre:"([^"]*)", precio: (\d*)\}\] como response$/) do |id_1, nombre_1, precio_1, id_2, nombre_2, precio_2, id_3, nombre_3, precio_3|
  datos_response = JSON.parse(@response.body)
  menus_esperados(datos_response, 0, Integer(id_1), nombre_1, Integer(precio_1))
  menus_esperados(datos_response, 1, Integer(id_2), nombre_2, Integer(precio_2))
  menus_esperados(datos_response, 2, Integer(id_3), nombre_3, Integer(precio_3))
end
