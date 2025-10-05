defmodule Matriz do
  @moduledoc """
  Módulo para operar con matrices cuadradas: imprimir, sumar, verificar simetría
  y recorrer sus diagonales principal y secundaria.
  """

  # ==============================================================================
  # PUNTO DE ENTRADA PRINCIPAL
  # ==============================================================================
  def main do
    matriz = [
      [1, 2, 3],
      [2, 4, 5],
      [3, 5, 6]
    ]

    IO.puts("La matriz es:")
    imprimir_matriz(matriz)

    IO.puts("\nVerificando si la matriz es simétrica...")
    if verificar_simetria(matriz) do
      IO.puts("La matriz es simétrica")
    else
      IO.puts("La matriz no es simétrica")
    end

    suma_total = sumar_matriz(matriz)
    IO.puts("\nLa suma de todos los elementos de la matriz es: #{suma_total}")

    IO.puts("\nLos elementos de la diagonal principal son:")
    recorrer_diagonal_principal(matriz)

    IO.puts("\nLos elementos de la diagonal secundaria son:")
    recorrer_diagonal_secundaria(matriz)

    suma_diagonal_sec = sumar_diagonal_secundaria(matriz)
    IO.puts("\nLa suma de los elementos de la diagonal secundaria es: #{suma_diagonal_sec}")
  end

  # ==============================================================================
  # IMPRIMIR MATRIZ
  # ==============================================================================
  @doc """
  Imprime la matriz de forma legible, fila por fila, con elementos separados por espacios.
  """
  def imprimir_matriz(matriz) do
    matriz
    |> Enum.each(fn fila ->
      fila
      |> Enum.map(&to_string/1)
      |> Enum.join("  ")
      |> IO.puts()
    end)
  end

  # ==============================================================================
  # SUMA DE TODOS LOS ELEMENTOS DE LA MATRIZ
  # ==============================================================================
  @doc """
  Calcula la suma de todos los elementos de la matriz, independientemente de su forma.
  """
  def sumar_matriz([]), do: 0

  def sumar_matriz([fila | resto]) do
    Enum.sum(fila) + sumar_matriz(resto)
  end

  # ==============================================================================
  # VERIFICAR SIMETRÍA
  # ==============================================================================
  @doc """
  Verifica si una matriz es simétrica.

  Una matriz es simétrica si:
    - Es cuadrada (n filas = n columnas).
    - Para todo i, j: matriz[i][j] == matriz[j][i].

  La matriz vacía se considera simétrica.
  """
  def verificar_simetria([]), do: true

  def verificar_simetria(matriz) do
    # Primero verificamos que sea cuadrada
    if cuadrada?(matriz) do
      transpuesta = transponer_matriz(matriz)
      matriz == transpuesta
    else
      false
    end
  end

  # ==============================================================================
  # TRANSPONER MATRIZ
  # ==============================================================================
  @doc """
  Devuelve la transpuesta de una matriz cuadrada o rectangular.

  La transpuesta se construye tomando cada columna de la matriz original
  como una nueva fila.
  """
  def transponer_matriz([]), do: []

  def transponer_matriz(matriz) do
    filas = length(matriz)
    # Asumimos que todas las filas tienen al menos la misma longitud que la primera
    columnas = if filas > 0, do: length(List.first(matriz)), else: 0

    for j <- 0..(columnas - 1) do
      for i <- 0..(filas - 1) do
        Enum.at(Enum.at(matriz, i), j)
      end
    end
  end

  # ==============================================================================
  # AUXILIAR: ¿ES CUADRADA?
  # ==============================================================================
  @doc false
  defp cuadrada?([]), do: true

  defp cuadrada?([fila | resto]) do
    n = length(fila)
    n > 0 and length([fila | resto]) == n and filas_de_misma_longitud?(resto, n)
  end

  @doc false
  defp filas_de_misma_longitud?([], _longitud_esperada), do: true

  defp filas_de_misma_longitud?([fila | resto], longitud_esperada) do
    length(fila) == longitud_esperada and filas_de_misma_longitud?(resto, longitud_esperada)
  end

  # ==============================================================================
  # DIAGONAL PRINCIPAL
  # ==============================================================================
  @doc """
  Recorre e imprime los elementos de la diagonal principal: (0,0), (1,1), (2,2), ...
  Solo tiene sentido en matrices cuadradas, pero se maneja con cuidado en caso contrario.
  """
  def recorrer_diagonal_principal(matriz) do
    recorrer_diagonal_principal(matriz, 0)
  end

  defp recorrer_diagonal_principal([], _indice), do: :ok

  defp recorrer_diagonal_principal([fila | resto], indice) do
    if indice < length(fila) do
      valor = Enum.at(fila, indice)
      IO.puts("Elemento diagonal principal [#{indice},#{indice}]: #{valor}")
    end
    recorrer_diagonal_principal(resto, indice + 1)
  end

  # ==============================================================================
  # DIAGONAL SECUNDARIA
  # ==============================================================================
  @doc """
  Recorre e imprime los elementos de la diagonal secundaria:
  (0, n-1), (1, n-2), ..., (n-1, 0).
  """
  def recorrer_diagonal_secundaria(matriz) do
    n = length(matriz)
    recorrer_diagonal_secundaria(matriz, n - 1)
  end

  defp recorrer_diagonal_secundaria([], _indice), do: :ok

  defp recorrer_diagonal_secundaria([fila | resto], indice) do
    if indice >= 0 and indice < length(fila) do
      valor = Enum.at(fila, indice)
      # Calculamos la fila actual como: total_filas - resto - 1
      # Pero para simplicidad, solo mostramos el valor
      IO.puts("Elemento diagonal secundaria: #{valor}")
    end
    recorrer_diagonal_secundaria(resto, indice - 1)
  end

  # ==============================================================================
  # SUMA DE LA DIAGONAL SECUNDARIA
  # ==============================================================================
  @doc """
  Calcula la suma de los elementos en la diagonal secundaria.
  """
  def sumar_diagonal_secundaria(matriz) do
    n = length(matriz)
    sumar_diagonal_secundaria(matriz, n - 1)
  end

  defp sumar_diagonal_secundaria([], _indice), do: 0

  defp sumar_diagonal_secundaria([fila | resto], indice) do
    valor =
      if indice >= 0 and indice < length(fila) do
        Enum.at(fila, indice)
      else
        0
      end
    valor + sumar_diagonal_secundaria(resto, indice - 1)
  end
end

Matriz.main()
