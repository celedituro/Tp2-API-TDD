# language: es

Característica: Calcular la comisión acumulada de un repartidor
Como empleador
Quiero calcular la comisión acumulada de un repartidor registrado

Antecedentes:
  Dado que soy un usuario registrado
  Y que uso el endpoint "/repartidores" con los datos {nombre_usuario:"fulanomengano", nombre: "Fulano Mengano"} como request body
  Y registro un repartidor
  Y creo un pedido con menu individual
  Y cambio el estado del pedido
  Y cambio el estado del pedido
  Y cambio el estado del pedido
  Y el estado es "entregado"
  Y el repartidor es "fulanomengano"

@local 
Escenario: Calcular comisión de un repartidor que realizó 1 pedido sin lluvia
  Dado uso el endpoint a "/calificaciones" con {id_usuario: "123" , id_pedido: 1, calificacion: 3}
  Y sin lluvia
  Cuando pregunto por las comisiones para el repartidor "fulanomengano"
  Entonces recibo {id_pedido: 1, comision: "5.0"}

@local 
Escenario: Calcular comisión de un repartidor que realizó 1 pedido con lluvia
  Dado uso el endpoint a "/calificaciones" con {id_usuario: "123" , id_pedido: 1, calificacion: 3}
  Y con lluvia
  Cuando pregunto por las comisiones para el repartidor "fulanomengano"
  Entonces recibo {id_pedido: 1, comision: "6.0"}

@local 
Escenario: Calcular comisión de un repartidor con calificación 1 sin lluvia
  Dado uso el endpoint a "/calificaciones" con {id_usuario: "123" , id_pedido: 1, calificacion: 1}
  Y sin lluvia
  Cuando pregunto por las comisiones para el repartidor "fulanomengano"
  Entonces recibo {id_pedido: 1, comision: "3.0"}

@local 
Escenario: Calcular comisión de un repartidor con calificación 5 sin lluvia
  Dado uso el endpoint a "/calificaciones" con {id_usuario: "123" , id_pedido: 1, calificacion: 5}
  Y sin lluvia
  Cuando pregunto por las comisiones para el repartidor "fulanomengano"
  Entonces recibo {id_pedido: 1, comision: "7.0"}

@local 
Escenario: Calcular comisión de un repartidor con calificación 1 con lluvia
  Dado uso el endpoint a "/calificaciones" con {id_usuario: "123" , id_pedido: 1, calificacion: 1}
  Y con lluvia
  Cuando pregunto por las comisiones para el repartidor "fulanomengano"
  Entonces recibo {id_pedido: 1, comision: "4.0"}

@local 
Escenario: Calcular comisión de un repartidor con calificación 5 con lluvia
  Dado uso el endpoint a "/calificaciones" con {id_usuario: "123" , id_pedido: 1, calificacion: 5}
  Y con lluvia
  Cuando pregunto por las comisiones para el repartidor "fulanomengano"
  Entonces recibo {id_pedido: 1, comision: "8.0"}

@local
Escenario: Calcular comisión de un repartidor con calificación 2 con lluvia
  Dado uso el endpoint a "/calificaciones" con {id_usuario: "123" , id_pedido: 1, calificacion: 2}
  Y con lluvia
  Cuando pregunto por las comisiones para el repartidor "fulanomengano"
  Entonces recibo {id_pedido: 1, comision: "6.0"}

