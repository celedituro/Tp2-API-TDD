Dado(/^que soy un usuario registrado con id_usuario: (\d+)$/) do |id_usuario|
  @request = {nombre: 'pepe', direccion: 'pepe direccion', telefono: '123-567', id: id_usuario}.to_json
  @response = Faraday.post(crear_usuario_url, @request, header)
end

Cuando(/^uso el endpoint a "([^"]*)" con \{id_usuario: (\d+) , id_menu: (\d+) \}$/) do |comando, id_usuario, id_menu|
  @comando = comando
  @request = {id_usuario: id_usuario, id_menu: id_menu}.to_json
end

Entonces('se crea un nuevo pedido') do
  p @request
  @response = Faraday.post("#{BASE_URL}#{@comando}", @request, header)
end

Entonces('recibo "\{{string}:{int},{string}:{int}, {string}:{string}, {string}:{int}-{int},{string}: undefined}') do |_string, _int, _string2, _int2, _string3, _string4, _string5, _int3, _int4, _string6|
  pending # Write code here that turns the phrase above into concrete actions
end
