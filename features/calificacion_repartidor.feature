# language: es

Característica: Calificar repartidores
  Como cliente registrado
  Quiero calificar al repartidor de mi pedido

Antecedentes:
  Dado que soy un usuario registrado

Escenario: Cliente califica al repartidor de un pedido entregado
  Dado que uso el endpoint "/repartidor" con los datos {nombre_usuario:"fulanomengano", nombre: "Fulano Mengano"} como request body
  Y registro un repartidor
  Y creo un pedido con menu individual
  Y cambio el estado del pedido
  Y cambio el estado del pedido
  Y cambio el estado del pedido
  Y que el estado del pedido es "entregado"
  Cuando uso el endpoint a "/calificacion" con {id_usuario: "123" , id_pedido: 1, calificacion: 3}
  Entonces recibo un código http "200"
  Y recibo {id_pedido: 1, calificacion: 3}

Escenario: Cliente califica al repartidor de un pedido recibido
  Dado creo un pedido con menu individual
  Y se crea un nuevo pedido
  Y que el estado del pedido es "recibido"
  Cuando uso el endpoint a "/calificacion" con {id_usuario: "123" , id_pedido: 1, calificacion: 3}
  Entonces recibo un código http "401"
  Y recibo un mensaje de error del tipo "Unauthorized"

Escenario: Cliente califica al repartidor de un pedido en preparacion
  Dado creo un pedido con menu individual
  Y se crea un nuevo pedido
  Y cambio el estado del pedido
  Y que el estado del pedido es "en preparación"
  Cuando uso el endpoint a "/calificacion" con {id_usuario: "123" , id_pedido: 1, calificacion: 3}
  Entonces recibo un código http "401"
  Y recibo un mensaje de error del tipo "Unauthorized"

Escenario: Cliente califica al repartidor de un pedido en camino
  Dado que uso el endpoint "/repartidor" con los datos {nombre_usuario:"fulanomengano", nombre: "Fulano Mengano"} como request body
  Y registro un repartidor
  Y creo un pedido con menu individual
  Y cambio el estado del pedido
  Y cambio el estado del pedido
  Y que el estado del pedido es "en camino"
  Cuando uso el endpoint a "/calificacion" con {id_usuario: "123" , id_pedido: 1, calificacion: 3}
  Entonces recibo un código http "401"
  Y recibo un mensaje de error del tipo "Unauthorized"
