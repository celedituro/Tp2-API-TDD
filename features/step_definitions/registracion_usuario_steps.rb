# language: es
Dado(/^que uso el endpoint "([^"]*)" con los datos \{nombre: "([^"]*)", direccion: "([^"]*)", telefono: "([^"]*)", id: (\d+)} como request body$/) do |_comando, nombre, direccion, telefono, id|
  @request = {nombre: nombre, direccion: direccion, telefono: telefono, id: id}.to_json
end

Cuando(/^se registra el usuario$/) do
  @response = Faraday.post(crear_usuario_url, @request, header)
end

Entonces(/^recibo un código http "([^"]*)"$/) do |codigo|
  expect(@response.status.to_s).to eq(codigo)
end

Cuando(/^recibo \{nombre: "([^"]*)", direccion: "([^"]*)", telefono: "([^"]*)", id: (\d+)} como response$/) do |nombre, direccion, telefono, id|
  datos_response = JSON.parse(@response.body)
  expect(datos_response['nombre']).to eq(nombre)
  expect(datos_response['direccion']).to eq(direccion)
  expect(datos_response['telefono']).to eq(telefono)
  expect(datos_response['id']).to eq(id)
end

Dado(/^que uso el endpoint "([^"]*)" con los datos \{nombre: "([^"]*)", telefono: "([^"]*)", id: (\d+)} como request body$/) do |_comando, nombre, telefono, id|
  @request = {nombre: nombre, telefono: telefono, id: id}.to_json
end

Entonces(/^recibo un mensaje de error del tipo "([^"]*)"$/) do |mensaje|
  datos_response = JSON.parse(@response.body)
  expect(datos_response['message']).to eq(mensaje)
end

Dado(/^que existe un usuario con teléfono "([^"]*)"$/) do |telefono|
  @request = {nombre: 'Juan', direccion: 'Cucha cucha', telefono: telefono, id: 1}.to_json
  @response = Faraday.post(crear_usuario_url, @request, header)
end

Cuando(/^intento el endpoint "([^"]*)" con los datos \{nombre: "([^"]*)", direccion: "([^"]*)", telefono: "([^"]*)", id: (\d+)} como request body$/) do |_comando, nombre, direccion, telefono, id|
  @request = {nombre: nombre, direccion: direccion, telefono: telefono, id: id}.to_json
  @response = Faraday.post(crear_usuario_url, @request, header)
end
