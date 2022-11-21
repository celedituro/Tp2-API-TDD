Dado(/^sin lluvia$/) do
  @fecha = Date.new(2022, 11, 10)
end

Dado(/^con lluvia$/) do
  @fecha = Date.new(2022, 11, 11)
end

Cuando(/^pregunto por las comisiones para el repartidor "([^"]*)"$/) do |nombre_repartidor|
  pedido_repo = Persistence::Repositories::PedidoRepository.new
  pedido = pedido_repo.buscar_por_id(@pedido_id)
  pedido.created_on = @fecha
  pedido_repo.actualizar(pedido)
  @pedido = pedido_repo.buscar_pedidos_de_repartidor(nombre_repartidor)[0]
  @api_tiempo = ServicioTiempoMock.new
  @calculador = ComisionesCalculador.new(@api_tiempo)
end

Entonces(/^recibo \{id_pedido: (\d+), comision: "([^"]*)"\}$/) do |_id_pedido, comision|
  datos_response = [{'id_pedido' => @pedido.id, 'comision' => @calculador.calcular(@pedido)}]
  expect(datos_response[0]['id_pedido']).to eq(@pedido_id)
  expect(datos_response[0]['comision']).to eq(Float(comision))
end
