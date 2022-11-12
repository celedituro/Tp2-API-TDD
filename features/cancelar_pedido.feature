# language: es

Característica: Cancelar un pedido
Como cliente registrado
Quiero cancelar un pedido

Antecedentes:
  Dado que uso el endpoint /registrar con los datos {"nombre": "pepe", "direccion":"Cucha20Cucha","telefono":"3452-1234"} como request body
  Y se registra el usuario
  Y recibo {"nombre": "pepe","direccion":"Cucha20Cucha","telefono":"3452-1234"} como response.

@wip
Escenario: Cliente cancela un pedido en estado recibido
  Dado uso el endpoint a "/pedido" con {id_usuario: "1" , id_menu: 1}\
  Y que el estado del pedido es "recibido"
  Cuando uso el endpoint a "/cancelacion" con {id_usuario: 1 , id_pedido: 1 }
  Entonces recibo un código http "200" y {id_pedido: 1}

@wip
Escenario: Cliente cancela un pedido en estado en preparación
  Dado uso el endpoint a "/pedido" con {id_usuario: "1" , id_menu: x1}\
  Y que el estado del pedido es "en preparacion"
  Cuando uso el endpoint a "/cancelacion" con {id_usuario: 1 , id_pedido: 1 }
  Entonces recibo un código http "200" y {id_pedido: 1}
