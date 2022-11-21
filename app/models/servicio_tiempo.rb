class ServicioTiempo
  FACTOR_SIN_LLUVIA = 0
  FACTOR_CON_LLUVIA = 0.01
  def obtener_factor_tiempo(fecha)
    precipitacion = obtener_precipitacion_desde_api(fecha)
    return FACTOR_SIN_LLUVIA if precipitacion.zero?

    FACTOR_CON_LLUVIA
  end

  def obtener_precipitacion_desde_api(fecha)
    url = "http://api.weatherapi.com/v1/forecast.json?key=cdcf1e248d1d413a82b125543222011&q=-34.59,-58.67&date=#{fecha}"
    respuesta = Faraday.get(url)
    body = JSON.parse(respuesta.body)
    body['forecast']['forecastday'][0]['day']['totalprecip_mm']
  end
end
