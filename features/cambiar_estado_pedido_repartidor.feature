# language: es

Característica: Cambiar el estado de un pedido
Como repartidor
Quiero cambiar el estado de un pedido de en camino a entregado

Antecedentes:
  Dado que soy un usuario registrado
  Y creo un pedido con menu individual

Escenario: El pedido pasa en camino a entregado
  Dado que el estado del pedido es "recibido"
  Y cambio el estado del pedido
  Y cambio el estado del pedido
  Y que el estado del pedido es "en camino"
  Cuando cambio el estado del pedido
  Y pregunto por el estado del pedido
  Entonces el estado es "entregado"
