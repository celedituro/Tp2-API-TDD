# language: es
Característica: Registración de repartidores
  Para poder asignar repartidores
  Como empleado de la Nonna
  Quiero registrar un repartidor

@wip
Escenario: Registración exitosa con codigo http
  Dado que uso el endpoint "/repartidor" con los datos {nombre_usuario:"fulanomengano", nombre: "Fulano Mengano"} como request body
  Cuando registro un repartidor
  Entonces recibo un código http "201"

@wip
Escenario: Registración exitosa
  Dado que uso el endpoint "/repartidor" con los datos {nombre_usuario:"fulanomengano", nombre: "Fulano Mengano"} como request body
  Cuando registro un repartidor
  Entonces recibo {nombre_usuario:"fulanomengano", nombre: "Fulano Mengano"} como response
