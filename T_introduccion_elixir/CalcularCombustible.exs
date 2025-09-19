defmodule CalcularCombustible do
  def main do
    nombre = "Nombre del conductor: "
      |> Util.ingresar_exs(:texto)

    kmts_recorridos = "Distancia recorrida en kilometros: "
    |> Util.ingresar(:real)

    combustible_comprado = "Combustible comprado: "
    |> Util.ingresar(:real)

    combustible_consumido = calcular_combustible_consumido(kmts_recorridos,combustible_comprado)
    |> to_string()
    mensaje = "Conductor #{nombre} su vehiculo consume #{combustible_consumido}L de gasolina por cada kilometro recorrido"
    |> Util.mostrar_mensaje_Java()
  end

  def calcular_combustible_consumido(kmts_recorridos,combustible_comprado) do
      combustible_consumido= kmts_recorridos/combustible_comprado
  end

end

CalcularCombustible.main()
