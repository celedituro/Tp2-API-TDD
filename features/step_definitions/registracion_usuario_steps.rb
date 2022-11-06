# language: es
When(/^que uso el endpoint "([^"]*)" con los datos \{nombre: "([^"]*)", direccion: "([^"]*)", telefono: "([^"]*)"} como request body$/) do |_comando, nombre, direccion, telefono|
  @request = {nombre: nombre, direccion: direccion, telefono: telefono}.to_json
end

Cuando(/^se registra el usuario$/) do
  @response = Faraday.post(crear_usuario_url, @request, header)
end

Entonces(/^recibo un código http "([^"]*)"$/) do |_codigo|
  expect(@response.status).to eq(201)
end

When(/^recibo \{nombre: "([^"]*)", direccion: "([^"]*)", telefono: "([^"]*)"} como response$/) do |nombre, direccion, telefono|
  datos_response = JSON.parse(@response.body)
  expect(datos_response['nombre']).to eq(nombre)
  expect(datos_response['direccion']).to eq(direccion)
  expect(datos_response['telefono']).to eq(telefono)
end

When(/^recibo un mensaje de error del tipo "([^"]*)"$/) do |_telefono|
  pending
end

When(/^que existe un usuario con teléfono "([^"]*)"$/) do |_telefono|
  pending
end

When(/^intento el endpoint "([^"]*)" con los datos "([^"]*)" como request body$/) do |_comando, _datos|
  pending
end
