When(/^que uso el endpoint "([^"]*)" con los datos \{nombre_usuario:"([^"]*)", nombre: "([^"]*)"\} como request body$/) do |comando, nombre_usuario, nombre|
  @comando = comando
  @request = {nombre_usuario: nombre_usuario, nombre: nombre}.to_json
end

When(/^registro un repartidor$/) do
  @response = Faraday.post("#{BASE_URL}#{@comando}", @request, header)
end

When(/^recibo \{nombre_usuario:"([^"]*)", nombre: "([^"]*)"\} como response$/) do |nombre_usuario, nombre|
  datos_response = JSON.parse(@response.body)
  expect(datos_response['nombre_usuario']).to eq(nombre_usuario)
  expect(datos_response['nombre']).to eq(nombre)
end
