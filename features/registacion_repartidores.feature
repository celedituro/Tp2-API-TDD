# language: es
Característica: Registración de repartidores
  Para poder asignar repartidores
  Como empleado de la Nonna
  Quiero registrar un repartidor

Escenario: Registración exitosa con codigo http
  Dado que uso el endpoint "/repartidores" con los datos {nombre_usuario:"fulanomengano", nombre: "Fulano Mengano"} como request body
  Cuando registro un repartidor
  Entonces recibo un código http "201"

Escenario: Registración exitosa
  Dado que uso el endpoint "/repartidores" con los datos {nombre_usuario:"fulanomengano", nombre: "Fulano Mengano"} como request body
  Cuando registro un repartidor
  Entonces recibo {nombre_usuario:"fulanomengano", nombre: "Fulano Mengano"} como response

Escenario: Registración con campos faltantes con codigo http
  Dado que uso el endpoint "/repartidores" con los datos {nombre_usuario:"fulanomengano"} como request body
  Cuando registro un repartidor
  Entonces recibo un código http "400"


Escenario: Registración con campos faltantes
  Dado que uso el endpoint "/repartidores" con los datos {nombre_usuario:"fulanomengano"} como request body
  Cuando registro un repartidor
  Entonces recibo un mensaje de error del tipo "Bad Request"

Escenario: Registración con nombre_usuario existente con codigo http
  Dado que existe un repartidor con usuario "pepepepito"
  Y que uso el endpoint "/repartidores" con los datos {nombre_usuario:"pepepepito", nombre: "Fulano Mengano"} como request body 
  Cuando registro un repartidor
  Entonces recibo un código http "409"

Escenario: Registración con nombre_usuario existente 
  Dado que existe un repartidor con usuario "pepepepito"
  Y que uso el endpoint "/repartidores" con los datos {nombre_usuario:"pepepepito", nombre: "Fulano Mengano"} como request body 
  Cuando registro un repartidor
  Entonces recibo un mensaje de error del tipo "Conflict"