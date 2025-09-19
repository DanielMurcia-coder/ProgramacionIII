defmodule IV do
  def main() do
    notas = %{
      150, 200, 50,
    }
    estudiantes = %{
      "Murcia" => 150,
      "Esteban" => 200,
      "Daniel" => 50,
    }

    IO.inspect(ventas)
    IO.inspect(analizar_ventas(ventas))
  end
end
