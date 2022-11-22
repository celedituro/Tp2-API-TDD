# language: es

Característica: Cancelar un pedido
Como cliente registrado
Quiero cancelar un pedido

Antecedentes:
  Dado que soy un usuario registrado
  Y creo un pedido con menu individual

Escenario: Cliente cancela un pedido en estado recibido
  Y que el estado del pedido es "recibido"
  Cuando uso el endpoint a "/cancelaciones" con id_pedido: 5
  Entonces recibo un código http "200"
  Y  recibo {id_pedido: 5, estado: "cancelado"}

Escenario: Cliente cancela un pedido en estado en preparación
  Y que el estado del pedido es "recibido"
  Y cambio el estado del pedido
  Y que el estado del pedido es "en preparación"
  Cuando uso el endpoint a "/cancelaciones" con id_pedido: 5
  Entonces recibo un código http "200"
  Y  recibo {id_pedido: 5, estado: "cancelado"}

Escenario: Cliente cancela un pedido en estado en camino con codigo http
  Dado que uso el endpoint "/repartidores" con los datos {nombre_usuario:"fulanomengano", nombre: "Fulano Mengano"} como request body
  Y registro un repartidor
  Y que el estado del pedido es "recibido"
  Y cambio el estado del pedido
  Y cambio el estado del pedido
  Y que el estado del pedido es "en camino"
  Cuando uso el endpoint a "/cancelaciones" con id_pedido: 5
  Entonces recibo un código http "401"

Escenario: Cliente cancela un pedido en estado en camino
  Dado que uso el endpoint "/repartidores" con los datos {nombre_usuario:"fulanomengano", nombre: "Fulano Mengano"} como request body
  Y registro un repartidor
  Y que el estado del pedido es "recibido"
  Y cambio el estado del pedido
  Y cambio el estado del pedido
  Y que el estado del pedido es "en camino"
  Cuando uso el endpoint a "/cancelaciones" con id_pedido: 5
  Entonces recibo un mensaje de error del tipo "Unauthorized"

Escenario: Cliente cancela un pedido en estado en espera con codigo htttp
  Dado que el estado del pedido es "recibido"
  Y cambio el estado del pedido
  Y que el estado del pedido es "en preparación"
  Y cambio el estado del pedido
  Y que el estado del pedido es "en espera"
  Cuando uso el endpoint a "/cancelaciones" con id_pedido: 5
  Entonces recibo un código http "401"

Escenario: Cliente cancela un pedido en estado en espera
  Dado que el estado del pedido es "recibido"
  Y cambio el estado del pedido
  Y que el estado del pedido es "en preparación"
  Y cambio el estado del pedido
  Y que el estado del pedido es "en espera"
  Cuando uso el endpoint a "/cancelaciones" con id_pedido: 5
  Entonces recibo un mensaje de error del tipo "Unauthorized"
