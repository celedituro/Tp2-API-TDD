# language: es

Característica: Realizar un pedido
Como cliente
Quiero realizar un pedido


Escenario: Cliente registrado pide un menú individual con codigo http
  Dado que soy un usuario registrado
  Cuando uso el endpoint a "/pedido" con {id_usuario: 1 , id_menu: 1 }
  Entonces se crea un nuevo pedido
  Y recibo un código http "201"

@wip
Escenario: Cliente registrado pide un menú individual 
  Dado que soy un usuario registrado
  Cuando uso el endpoint a "/pedido" con {id_usuario:1 , id_menu: 1 }
  Entonces se crea un nuevo pedido
  Y recibo "{"id_pedido":2,"id_menu":1, "estado":"recibido", "id_comprador":4314-1234,"id_repartidor": undefined}

