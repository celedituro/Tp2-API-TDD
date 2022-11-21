# language: es

Característica: Consultar pedido realizados
Como cliente registrado
Quiero consultar mis pedidos realizados

Escenario: Cliente realizó 3 pedidos y consulta por sus pedidos realizados
  Dado que soy un usuario registrado con id_usuario: "100"
  Y uso el endpoint a "/pedido" con {id_usuario: "100" , id_menu: 1 }
  Y se crea un nuevo pedido
  Y uso el endpoint a "/pedido" con {id_usuario: "100" , id_menu: 1 }
  Y se crea un nuevo pedido
  Y uso el endpoint a "/pedido" con {id_usuario: "100" , id_menu: 3 }
  Y se crea un nuevo pedido
  Cuando uso el endpoint "/pedidos/100"
  Entonces recibo [{id_pedido: 1, id: 1, nombre:"Menu individual", precio: 100, estado:"recibido"},{id_pedido: 2, id: 1, nombre:"Menu individual", precio: 100, estado:"recibido"},{id_pedido: 4, id: 3, nombre:"Menu familiar", precio: 250, estado:"recibido"}] como response

Escenario: Cliente no realizó pedidos y consulta por sus pedidos realizados
  Dado que soy un usuario registrado con id_usuario: "100"
  Y que no realizo un pedido
  Cuando uso el endpoint "/pedidos/100"
  Entonces recibo [] como response
  Y recibo un código http "200"
