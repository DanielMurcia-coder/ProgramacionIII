defmodule CalcularInventario do
  def main do
    titulo = "Título del libro: "
      |> Util.ingresar_exs(:texto)

    unidades_disponibles= "Ingrese cantidad de unidades del libro disponibles: "
    |> Util.ingresar(:entero)

    precio_unitario = "Ingrese el precio de cada libro: "
    |> Util.ingresar(:real)

    precio_total = calcular_inventario(unidades_disponibles,precio_unitario)

    mensaje = "El libro #{titulo} tiene #{unidades_disponibles} unidades, con un valor total de $#{precio_total}."
    |> Util.mostrar_mensaje_Java()
  end

  def calcular_inventario(unidades_disponibles, precio_unitario) do
      precio_total= unidades_disponibles*precio_unitario
  end

end

CalcularInventario.main()
