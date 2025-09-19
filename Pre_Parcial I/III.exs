defmodule III do

  def main() do
    ventas = %{
      "Lunes" => 150,
      "Martes" => 200,
      "Miércoles" => 50,
      "Jueves" => 300,
      "Viernes" => 250
    }

    IO.inspect(ventas)
    IO.inspect(analizar_ventas(ventas))
  end

  def analizar_ventas(ventas_map) do
    case Map.size(ventas_map) do
      0 ->
        {0, 0, "No hay datos"}

      _ ->
        ventas = Map.values(ventas_map)
        total_ventas = Enum.sum(ventas)
        promedio = total_ventas / length(ventas)

        # Encontrar el día con mejor venta
        {mejor_dia, mejor_venta} = Enum.max_by(ventas_map, fn {_dia, venta} -> venta end)

        {total_ventas, promedio, mejor_dia}
    end
  end
end

III.main()
