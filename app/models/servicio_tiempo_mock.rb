class ServicioTiempoMock
  FACTOR_SIN_LLUVIA = 0
  FACTOR_CON_LLUVIA = 0.01
  def obtener_factor_tiempo(fecha)
    if Date.new(2022, 11, 11) == fecha
      FACTOR_CON_LLUVIA
    else
      FACTOR_SIN_LLUVIA
    end
  end
end
