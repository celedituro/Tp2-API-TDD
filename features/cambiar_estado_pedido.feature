# language: es

Característica: Cambiar el estado de un pedido
Como empleador
Quiero cambiar el estado de un pedido

Antecedentes:
Dado que soy un usuario registrado 
Y creo un pedido con menu individual

@wip
Escenario: El pedido pasa de recibido a en preparación
Dado que el estado del pedido es "recibido"
Cuando cambio el estado del pedido
Y pregunto por el estado del pedido
Entonces el estado es “en preparación”

@wip
Escenario: El pedido pasa en preparación a en camino
Dado se termina de preparar un pedido
Y hay repartidores libres
Cuando cambio el estado del pedido
Y pregunto por el estado del pedido
Entonces el estado es “En camino”

@wip
Escenario: El pedido pasa en camino a entregado
Dado se entrega un pedido
Cuando cambio el estado del pedido
Y pregunto por el estado del pedido
Entonces el estado es “Entregado”
