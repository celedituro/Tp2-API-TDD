# language: es

Característica: Consultar pedido realizados
Como cliente registrado
Quiero consultar mis pedidos realizados

@wip
Escenario: Cliente realizó 3 pedidos y consulta por sus pedidos realizados
  Dado que soy un usuario registrado con id_usuario: "1"
  Y uso el endpoint a "/pedido" con {id_usuario: "1" , id_menu: 1 }
  Y uso el endpoint a "/pedido" con {id_usuario: "1" , id_menu: 1 }
  Y uso el endpoint a "/pedido" con {id_usuario: "1" , id_menu: 1 }
  Cuando uso el endpoint "/pedidos/1"
  Entonces recibo [{id_pedido: 1, id: 1, nombre:"Menu individual", precio: 100, estado:"entregado"},{id_pedido: 2, id: 1, nombre:"Menu individual", precio: 100, estado:"en preparacion"},{id_pedido: 4, id: 3, nombre:"Menu familiar", precio: 250, estado:"recibido"}] como response
