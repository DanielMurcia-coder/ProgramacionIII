defmodule RegistroVehiculoPeaje do
  def main do
    nombre = "Ingrese su nombre: "
    |> Util.ingresar_exs(:texto)

    unidad= "Ingrese la temperatura en Celcius: "
    |> Util.ingresar(:real)

    tipo_unidad = "Ingrese la unidad de la temperatura que quiere calcular(K/F): "
    |> Util.ingresar_exs(:texto)
    |> String.upcase()

    newUnidad= convertir_unidad_temp(unidad,tipo_unidad)

    mensaje= "#{nombre}, #{unidad}°C son: #{newUnidad}°#{tipo_unidad}"
    |> Util.mostrar_mensaje_Java()
  end

  def convertir_unidad_temp(unidad, tipo_unidad) do
    case tipo_unidad do
      "F" ->
        (unidad * 9 / 5) + 32

      "K" ->
        unidad + 273.15

      _ ->
        unidad
    end
  end

end

RegistroVehiculoPeaje.main()
