# language: es

Característica: Realizar un pedido
Como cliente
Quiero realizar un pedido

Escenario: Cliente registrado pide un menú individual con codigo http
  Dado que soy un usuario registrado con id_usuario: "1"
  Cuando uso el endpoint a "/pedidos" con {id_usuario: "1" , id_menu: 1 }
  Entonces se crea un nuevo pedido
  Y recibo un código http "201"

Escenario: Cliente registrado pide un menú individual
  Dado que soy un usuario registrado
  Cuando uso el endpoint a "/pedidos" con {id_usuario: "1" , id_menu: 1 }
  Entonces se crea un nuevo pedido
  Y recibo con nombre_menu: "Menu individual"

Escenario: Cliente no registrado pide un menú disponible con codigo http
  Cuando uso el endpoint a "/pedidos" con {id_usuario: "1" , id_menu: 1 }
  Y realizo un nuevo pedido
  Entonces recibo un código http "401"

Escenario: Cliente no registrado pide un menú disponible
  Cuando uso el endpoint a "/pedidos" con {id_usuario: "1" , id_menu: 1 }
  Y realizo un nuevo pedido
  Entonces recibo un mensaje de error del tipo "Unauthorized"

Escenario: Cliente registrado pide un menú que no existe con codigo http
  Dado que soy un usuario registrado
  Cuando uso el endpoint a "/pedidos" con {id_usuario: "1" , id_menu: 5 }
  Y realizo un nuevo pedido
  Entonces recibo un código http "400"

Escenario: Cliente registrado pide un menú que no existe
  Dado que soy un usuario registrado
  Cuando uso el endpoint a "/pedidos" con {id_usuario: "1" , id_menu: 5 }
  Y realizo un nuevo pedido
  Entonces recibo un mensaje de error del tipo "Bad Request"

