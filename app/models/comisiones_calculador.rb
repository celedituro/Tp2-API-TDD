class ComisionesCalculador
  def initialize(servicio_tiempo)
    @servicio_tiempo = servicio_tiempo
    @porcentaje = {1 => 0.03, 2 => 0.05}
  end

  def calcular(pedido)
    calificacion = pedido.calificacion
    precio = pedido.menu.precio
    fecha_creacion = pedido.created_on
    adicional = @servicio_tiempo.obtener_tiempo(fecha_creacion)

    precio * @porcentaje[calificacion] + adicional
  end
end
