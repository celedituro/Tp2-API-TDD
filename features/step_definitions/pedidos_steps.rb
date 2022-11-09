Cuando(/^uso el endpoint a "([^"]*)" con \{id_usuario: (\d+) , id_menu: (\d+) \}$/) do |comando, id_usuario, id_menu|
  @comando = comando
  @request = {id_usuario: id_usuario, id_menu: id_menu}.to_json
end

Entonces('se crea un nuevo pedido') do
  @response = Faraday.post("#{BASE_URL}#{@comando}", @request, header)
end

Entonces('recibo "\{{string}:{int},{string}:{int}, {string}:{string}, {string}:{int}-{int},{string}: undefined}') do |_string, _int, _string2, _int2, _string3, _string4, _string5, _int3, _int4, _string6|
  pending # Write code here that turns the phrase above into concrete actions
end
