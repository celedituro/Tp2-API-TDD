# language: es

Característica: Consultar por los menús disponibles
Para hacer un pedido
Como cliente
Puedo consultar por los menús disponibles

  Escenario: Cliente registrado consulta por los menús disponibles
    Dado que soy un usuario registrado
    Cuando realizo un GET a "/menus/1"
    Entonces recibo [{id:1, nombre:"Menu individual", precio: 100},{id:2, nombre:"Menu parejas", precio: 175},{id:3, nombre:"Menu familiar", precio: 250}] como response

  
  Escenario: Cliente registrado consulta por los menús disponibles con codigo http
    Dado que soy un usuario registrado
    Cuando realizo un GET a "/menus/1"
    Entonces recibo un código http "200"

  
  Escenario: Cliente no registrado consulta por los menús disponibles
    Cuando realizo un GET a "/menus/123"
    Entonces recibo un mensaje de error del tipo "Unauthorized"
    Y recibo un código http "401"