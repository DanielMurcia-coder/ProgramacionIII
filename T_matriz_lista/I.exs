defmodule I do
  def main do
    lista = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
    IO.puts("Lista original: #{inspect(lista)}")
    IO.puts("La suma de números pares en la lista es: #{contar_pares_lista(lista)}")
    IO.puts("La lista invertida es: #{inspect(invertir_lista(lista))}")

    matriz = [
      [1, 2, 3],
      [4, 4, 5],
      [3, 5, 6]
    ]

    IO.puts("La suma de todos los elementos de la matriz es: #{sumar_matriz(matriz)}")
    IO.puts("La matriz transpuesta es:")
    imprimir_matriz(transponer_matriz(matriz))

    mensaje = ("Ingrese la suma entera a buscar en la lista:")
    num= Util.ingresar(mensaje,:entero)
    IO.puts("¿Existen dos números en la lista que sumen #{num}?")
    case buscar_suma(lista, num) do
      {a, b} ->
        IO.puts("Sí: #{a} + #{b} = #{num}")
      nil ->
        IO.puts("No")
    end
  end

  # Contar suma de pares usando divide y vencerás
  def contar_pares_lista([]), do: 0
  def contar_pares_lista([x]), do: (if rem(x, 2) == 0, do: x, else: 0)
  def contar_pares_lista(lista) do
    mitad = div(length(lista), 2)
    {izq, der} = Enum.split(lista, mitad)

    elem_izq = contar_pares_lista(izq)
    elem_der = contar_pares_lista(der)

    elem_izq + elem_der
  end

  # Invertir lista recursivamente
  def invertir_lista([]), do: []
  def invertir_lista([x]), do: [x]
  def invertir_lista([head | tail]), do: invertir_lista(tail) ++ [head]

  # Sumar todos los elementos de una matriz
  def sumar_matriz([]), do: 0
  def sumar_matriz([fila | resto]), do: Enum.sum(fila) + sumar_matriz(resto)

  # Transponer matriz
  def transponer_matriz([]), do: []
  def transponer_matriz(matriz) do
    filas = length(matriz)
    columnas = if filas > 0, do: length(List.first(matriz)), else: 0

    for j <- 0..(columnas - 1) do
      for i <- 0..(filas - 1) do
        Enum.at(Enum.at(matriz, i), j)
      end
    end
  end

  def buscar_suma([], _num), do: nil
  def buscar_suma([_x], _num), do: nil
  def buscar_suma([], _num), do: nil
  def buscar_suma([x | resto], num) do
    case Enum.find(resto, fn y -> x + y == num end) do
      nil -> buscar_suma(resto, num)
      y -> {x, y}
    end
  end

  # Imprimir matriz (solo para listas de listas)
  def imprimir_matriz(matriz) do
    matriz
    |> Enum.each(fn fila ->
      fila
      |> Enum.map(&to_string/1)
      |> Enum.join("  ")
      |> IO.puts()
    end)
  end
end

I.main()
