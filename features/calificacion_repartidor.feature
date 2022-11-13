# language: es

Característica: Calificar repartidores
  Como cliente registrado
  Quiero calificar al repartidor de mi pedido

@wip
Escenario: Cliente califica al repartidor de un pedido entregado
  Dado que estoy registrado como "pepe"
  Y uso el endpoint a "/pedido" con {id_usuario: "1" , id_menu: 1}
  Y que el estado de mi pedido es "recibido"
  Cuando uso el endpoint a "/calificacion" con {id_usuario: 1 , id_pedido: 1, calificacion: 3}
  Entonces recibo un código http "200" y recibo {id_pedido: 1}

