defmodule Mapas do
  def main do
    mi_mapa = %{"nombre" => "Elixir", "version" => 1.15}
    IO.inspect(mi_mapa)
    mi_mapa_atom = %{nombre: "Elixir", version: 1.15}
    IO.inspect(mi_mapa_atom)
    IO.inspect(mi_mapa_atom.version)
    suma = Enum.reduce([1, 2, 3, 4], 0, fn x, acc -> acc + x end)
    IO.puts suma  # => 10

  end

end
Mapas.main()
