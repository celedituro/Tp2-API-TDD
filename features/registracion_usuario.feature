# language: es
  Característica: Registración del cliente
    Para hacer un pedido
    Como cliente
    Quiero crear una cuenta para poder loguearme

  @local
  Escenario: Registración exitosa con código http
    Dado que uso el endpoint "/registrar" con los datos {nombre: "Juan", direccion: "Cucha20Cucha", telefono: "3451-1234", id: "6574"} como request body
    Cuando se registra el usuario
    Entonces recibo un código http "201"

  @local
  Escenario: Registración exitosa
    Dado que uso el endpoint "/registrar" con los datos {nombre: "Juan", direccion: "Cucha20Cucha", telefono: "3451-1234", id: "6574"} como request body
    Cuando se registra el usuario
    Entonces recibo {nombre: "Juan", direccion: "Cucha20Cucha", telefono: "3451-1234", id: "6574"} como response

  @local
  Escenario: Registración con campos faltantes con codigo http
    Dado que uso el endpoint "/registrar" con los datos {nombre: "Juan", telefono: "3452-1234", id: "6574"} como request body
    Cuando se registra el usuario
    Entonces recibo un código http "400"

  @local
  Escenario: Registración con campos faltantes
    Dado que uso el endpoint "/registrar" con los datos {nombre: "Juan", telefono: "3452-1234", id: "6574"} como request body
    Cuando se registra el usuario
    Entonces recibo un mensaje de error del tipo "Bad Request"

  @local
  Escenario: Registración con teléfono existente
    Dado que existe un usuario con teléfono "5123-1234"
    Cuando intento el endpoint "/registrar" con los datos {nombre: "Juan", direccion: "Cucha20Cucha", telefono: "5123-1234", id: "1"} como request body
    Entonces recibo un código http "409"

  @local
  Escenario: Registración con teléfono existente
    Dado que existe un usuario con teléfono "5123-1234"
    Cuando intento el endpoint "/registrar" con los datos {nombre: "Juan", direccion: "Cucha20Cucha", telefono: "5123-1234", id: "1"} como request body
    Entonces recibo un mensaje de error del tipo "Conflict"

  @local
  Escenario: Registración con id_usuario existente
    Dado que existe un usuario con id_usuario "1"
    Cuando intento el endpoint "/registrar" con los datos {nombre: "Juan", direccion: "Cucha20Cucha", telefono: "5123-1234", id: "1"} como request body
    Entonces recibo un código http "409"

  @local
  Escenario: Registración con id_usuario existente
    Dado que existe un usuario con id_usuario "1"
    Cuando intento el endpoint "/registrar" con los datos {nombre: "Juan", direccion: "Cucha20Cucha", telefono: "5123-1234", id: "1"} como request body
    Entonces recibo un mensaje de error del tipo "Conflict"
