# language: es

Característica: Cambiar el estado de un pedido
Como empleador
Quiero cambiar el estado de un pedido

Antecedentes:
  Dado que soy un usuario registrado
  Y creo un pedido con menu individual

Escenario: El pedido pasa de recibido a en preparación
  Dado que el estado del pedido es "recibido"
  Cuando cambio el estado del pedido
  Y pregunto por el estado del pedido
  Entonces el estado es "en preparación"

Escenario: El pedido pasa en preparación a en camino
  Dado que uso el endpoint "/repartidor" con los datos {nombre_usuario:"fulanomengano", nombre: "Fulano Mengano"} como request body
  Y registro un repartidor
  Y que el estado del pedido es "recibido"
  Y cambio el estado del pedido
  Y que el estado del pedido es "en preparación"
  Cuando cambio el estado del pedido
  Y pregunto por el estado del pedido
  Entonces el estado es "en camino"

Escenario: El pedido pasa del estado en preparación al estado en espera
  Dado que el estado del pedido es "recibido"
  Y cambio el estado del pedido
  Y que el estado del pedido es "en preparación"
  Cuando cambio el estado del pedido
  Entonces que el estado del pedido es "en espera"

@wip
Escenario: El pedido pasa en espera a en camino
  Dado que el estado del pedido es "recibido"
  Y cambio el estado del pedido
  Y que el estado del pedido es "en preparación"
  Y cambio el estado del pedido
  Y que el estado del pedido es "en espera"
  Y que uso el endpoint "/repartidor" con los datos {nombre_usuario:"fulanomengano", nombre: "Fulano Mengano"} como request body
  Y registro un repartidor
  Cuando cambio el estado del pedido
  Entonces el repartidor es "fulanomengano"
  Y el estado es "en camino"
