# language: es

Característica: Calcular la comisión acumulada de un repartidor
Como empleador
Quiero calcular la comisión acumulada de un repartidor registrado

Antecedentes:
  Dado que soy un usuario registrado
  Y que uso el endpoint "/repartidor" con los datos {nombre_usuario:"fulanomengano", nombre: "Fulano Mengano"} como request body
  Y registro un repartidor
  Y creo un pedido con menu individual
  Y cambio el estado del pedido
  Y cambio el estado del pedido
  Y cambio el estado del pedido
  Y el estado es "entregado"
  Y el repartidor es "fulanomengano"

Escenario: Calcular comisión de un repartidor que realizó 1 pedido sin lluvia
  Dado uso el endpoint a "/calificacion" con {id_usuario: "123" , id_pedido: 1, calificacion: 3}
  Y sin lluvia
  Cuando uso el endpoint a "/comisiones" con {nombre_usuario: "fulanomengano"}
  Entonces recibo {id_pedido: 1, comision: "5.0"}

@wip
Escenario: Calcular comisión de un repartidor que realizó 1 pedido con lluvia
  Dado uso el endpoint a "/calificacion" con {id_usuario: "123" , id_pedido: 1, calificacion: 3}
  Y con lluvia
  Cuando uso el endpoint a "/comisiones" con {nombre_usuario: "fulanomengano"}
  Entonces recibo {id_pedido: 1, comision: 6}

@wip
Escenario: Calcular comisión de un repartidor con calificación 1
  Dado uso el endpoint a "/calificacion" con {id_usuario: "123" , id_pedido: 1, calificacion: 1}
  Y sin lluvia
  Cuando uso el endpoint a "/comisiones" con {nombre_usuario: "fulanomengano"}
  Entonces recibo {id_pedido: 1, comision: 3}

@wip
Escenario: Calcular comisión de un repartidor con calificación 5
  Dado uso el endpoint a "/calificacion" con {id_usuario: "123" , id_pedido: 1, calificacion: 5}
  Y sin lluvia
  Cuando uso el endpoint a "/comisiones" con {nombre_usuario: "fulanomengano"}
  Entonces recibo {id_pedido: 1, comision: 7}
