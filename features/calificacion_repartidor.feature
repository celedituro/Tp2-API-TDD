# language: es

Característica: Calificar repartidores
  Como cliente registrado
  Quiero calificar al repartidor de mi pedido

@wip
Escenario: Cliente califica al repartidor de un pedido entregado
  Dado que soy un usuario registrado
  Y creo un pedido con menu individual
  Y se crea un nuevo pedido
  Y que el estado del pedido es "recibido"
  Cuando uso el endpoint a "/calificacion" con {id_usuario: "123" , id_pedido: 1, calificacion: 3}
  Entonces recibo un código http "200"
  Y recibo {id_pedido: 1}

