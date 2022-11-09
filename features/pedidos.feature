# language: es

Característica: Realizar un pedido
Como cliente
Quiero realizar un pedido

@wip
Escenario: Cliente registrado pide un menú individual con codigo http
  Dado que estoy registrado
  Cuando uso el endpoint a "/pedido" con {"nombre": "Juan", "direccion": "Cucha Cucha 213", "telefono": "4314-1234", "id_menu": 1 }
  Entonces se crea un nuevo pedido
  Y recibo un codigo http "202"

@wip
Escenario: Cliente registrado pide un menú individual 
  Dado que estoy registrado
  Cuando uso el endpoint a "/pedido" con {"nombre": "Juan", "direccion": "Cucha Cucha 213", "telefono": "4314-1234", "id_menu": 1 }
  Entonces se crea un nuevo pedido
  Y recibo "{"id_pedido":2,"id_menu":1, "estado":"recibido", "id_comprador":4314-1234,"id_repartidor": undefined}

