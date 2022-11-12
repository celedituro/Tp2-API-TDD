# language: es

Característica: Cancelar un pedido
Como cliente registrado
Quiero cancelar un pedido

Antecedentes:
  Dado que soy un usuario registrado
  Y creo un pedido con menu individual

Escenario: Cliente cancela un pedido en estado recibido
  Y que el estado del pedido es "recibido"
  Cuando uso el endpoint a "/cancelacion" con id_pedido: 5
  Entonces recibo un código http "200"
  Y  recibo {id_pedido: 5, estado: "cancelado"}

@wip
Escenario: Cliente cancela un pedido en estado en preparación
  Y cambio el estado del pedido
  Y que el estado del pedido es "recibido"
  Y cambio el estado del pedido
  Y que el estado del pedido es "en preparacion"
  Cuando uso el endpoint a "/cancelacion" con id_pedido: 5
  Entonces recibo un código http "200"
  Y  recibo {id_pedido: 5, estado: "cancelado"}
