# language: es
  Característica: Consultar el estado de un pedido
  Como cliente registrado
  Quiero consultar el estado de un pedido realizado

  Antecedentes:
    Dado que soy un usuario registrado

  Escenario: Cliente consulta un pedido realizado con codigo http
    Dado creo un pedido con menu individual
    Y que el estado del pedido es "recibido"
    Cuando uso el endpoint "/pedido" para consultar el estado del pedido
    Entonces recibo un código http "200"

  Escenario: Cliente consulta un pedido realizado
    Dado creo un pedido con menu individual
    Y que el estado del pedido es "recibido"
    Cuando uso el endpoint "/pedido" para consultar el estado del pedido
    Entonces recibo {nombre_menu: "Menu individual", id_pedido: 3, estado: "recibido"}

  Escenario: Cliente consulta un pedido realizado y cambia de estado
    Dado creo un pedido con menu individual
    Y uso el endpoint "/pedido" para consultar el estado del pedido
    Y recibo {nombre_menu: "Menu individual", id_pedido: 2, estado: "recibido"}
    Cuando cambio el estado del pedido
    Y uso el endpoint "/pedido" para consultar el estado del pedido
    Y recibo {nombre_menu: "Menu individual", id_pedido: 2, estado: "en preparación"}
