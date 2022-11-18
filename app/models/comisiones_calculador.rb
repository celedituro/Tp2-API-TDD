class ComisionesCalculador
  def initialize(servicio_tiempo)
    @servicio_tiempo = servicio_tiempo
    @porcentaje = {1 => 0.03, 2 => 0.05, 3 => 0.05, 4 => 0.05, 5 => 0.07}
  end

  def calcular(pedido)
    calificacion = pedido.calificacion
    precio = pedido.menu.precio
    fecha_creacion = pedido.created_on
    adicional = @servicio_tiempo.obtener_tiempo(fecha_creacion)

    total = precio * @porcentaje[calificacion] + adicional
    total.round()
  end
end
