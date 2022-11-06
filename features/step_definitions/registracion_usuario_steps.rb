# language: es
Dado(/^que uso el endpoint "([^"]*)" con los datos "([^"]*)" como request body$/) do |_comando, datos|
  @request = datos
end

Cuando(/^se registra el usuario$/) do
  @response = Faraday.post(crear_usuario_url, @request, header)
end

Entonces(/^recibo un código http "([^"]*)"$/) do |_codigo|
  expect(@response.status).to eq(201)
end

When(/^recibo "([^"]*)" como response$/) do |_datos|
  pending
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
