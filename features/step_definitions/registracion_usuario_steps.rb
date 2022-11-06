# language: es
Dado(/^que uso el endpoint "([^"]*)" con los datos \{nombre: "([^"]*)", direccion: "([^"]*)", telefono: "([^"]*)"} como request body$/) do |_comando, nombre, direccion, telefono|
  Persistence::Repositories::UsuarioRepository.new.eliminar_todos
  @request = {nombre: nombre, direccion: direccion, telefono: telefono}.to_json
end

Cuando(/^se registra el usuario$/) do
  @response = Faraday.post(crear_usuario_url, @request, header)
end

Entonces(/^recibo un código http "([^"]*)"$/) do |codigo|
  expect(@response.status.to_s).to eq(codigo)
end

Cuando(/^recibo \{nombre: "([^"]*)", direccion: "([^"]*)", telefono: "([^"]*)"} como response$/) do |nombre, direccion, telefono|
  datos_response = JSON.parse(@response.body)
  expect(datos_response['nombre']).to eq(nombre)
  expect(datos_response['direccion']).to eq(direccion)
  expect(datos_response['telefono']).to eq(telefono)
end

Dado(/^que uso el endpoint "([^"]*)" con los datos \{nombre: "([^"]*)", telefono: "([^"]*)"} como request body$/) do |_comando, nombre, telefono|
  Persistence::Repositories::UsuarioRepository.new.eliminar_todos
  @request = {nombre: nombre, telefono: telefono}.to_json
end

Entonces(/^recibo un mensaje de error del tipo "([^"]*)"$/) do |mensaje|
  datos_response = JSON.parse(@response.body)
  Persistence::Repositories::UsuarioRepository.new.eliminar_todos
  expect(datos_response['message']).to eq(mensaje)
end

Dado(/^que existe un usuario con teléfono "([^"]*)"$/) do |telefono|
  Persistence::Repositories::UsuarioRepository.new.eliminar_todos
  @request = {nombre: 'Juan', direccion: 'Cucha cucha', telefono: telefono}.to_json
  @response = Faraday.post(crear_usuario_url, @request, header)
end

Cuando(/^intento el endpoint "([^"]*)" con los datos \{nombre: "([^"]*)", direccion: "([^"]*)", telefono: "([^"]*)"} como request body$/) do |_comando, nombre, direccion, telefono|
  @request = {nombre: nombre, direccion: direccion, telefono: telefono}.to_json
  @response = Faraday.post(crear_usuario_url, @request, header)
end
