defmodule II do
  def main() do
    inventario = %{
      "manzanas" => 10,
      "naranjas" => 5,
      "platanos" => 8
    }
    IO.inspect(inventario)
    IO.inspect(actualizar_inventario(inventario, "manzanas", 5))
  end

  def actualizar_inventario(inventario, producto, cantidad) do
    Enum.map(inventario, fn {key, value} ->
      if key == producto do
        {key, value + cantidad}
      else
        {key, value}
      end
    end)
  end
end
II.main() 
