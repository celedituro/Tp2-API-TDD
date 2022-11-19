# language: es

Característica: Mochila para llevar pedidos
Como repartidor
Quiero tener una capacidad máxima para llevar pedidos

  Antecedentes:
    Dado que uso el endpoint "/repartidor" con los datos {nombre_usuario:"fulanomengano", nombre: "Fulano Mengano"} como request body
    Y registro un repartidor
    Y la capacidad de la mochila es 6 para "fulanomengano"
    Y que soy un usuario registrado
    Y creo un pedido con menu familiar
    Y cambio el estado del pedido
    Y cambio el estado del pedido
    Y el estado es "en camino"
    Y el repartidor es "fulanomengano"
    Y la capacidad libre de la mochila es 2 para "fulanomengano"

  @local
  Escenario: Repartidor con espacio en la mochila
    Dado creo un pedido con menu individual
    Y cambio el estado del pedido
    Cuando cambio el estado del pedido
    Entonces el estado es "en camino"
    Y el repartidor es "fulanomengano"
    Y la capacidad libre de la mochila es 1 para "fulanomengano"

  @local
  Escenario: Repartidor sin espacio en la mochila
    Dado creo un pedido con menu familiar
    Y cambio el estado del pedido
    Cuando cambio el estado del pedido
    Entonces el estado es "en espera"
    Y el repartidor es "No asignado"
    Y la capacidad libre de la mochila es 2 para "fulanomengano"
