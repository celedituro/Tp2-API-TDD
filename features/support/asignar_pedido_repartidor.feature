# language: es

Característica: Asignar pedidos a repartidores
Como empleador
Quiero asignar pedidos a repartidores

  @wip
  Escenario: Asignar pedido a un repartidor libre
  Dado que el estado del pedido es "en preparación"
  Y el id_repartidor asociado al pedido es "nil"
  Cuando se buscan los repartidores libres
  Y el repartidor con id_repartidor 1 está libre
  Entonces el id_repartidor del pedido es 1
  Y el estado del pedido pasa a ser "en camino"
