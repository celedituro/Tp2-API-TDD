# language: es

Característica: Asignar pedidos a repartidores
Como empleador
Quiero asignar pedidos a repartidores

Antecedentes:
  Dado que soy un usuario registrado
  Y que uso el endpoint "/repartidores" con los datos {nombre_usuario:"fulanomengano", nombre: "Fulano Mengano"} como request body
  Y registro un repartidor
  Y creo un pedido con menu individual
  Y el estado es "recibido"
  Y cambio el estado del pedido

Escenario: Asignar pedido a un repartidor libre
  Dado el estado es "en preparación"
  Cuando cambio el estado del pedido
  Y el estado es "en camino"
  Entonces el repartidor es "fulanomengano"
