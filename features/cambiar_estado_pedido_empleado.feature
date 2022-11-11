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
Dado que el estado del pedido es "recibido"
Y cambio el estado del pedido
Y que el estado del pedido es "en preparación"
Cuando cambio el estado del pedido
Y pregunto por el estado del pedido
Entonces el estado es "en camino"
