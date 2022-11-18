class ServicioTiempo
  def obtener_tiempo(fecha)
    if Date.new(2022, 11, 11) == fecha
      0.01
    else
      0
    end
  end
end
