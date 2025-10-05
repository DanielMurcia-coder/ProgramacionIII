defmodule IV do
  @moduledoc """
  Módulo que implementa funciones recursivas para:
  - Encontrar el mayor elemento en una lista.
  - Ordenar una lista de mayor a menor usando Merge Sort.
  """

  # --- PUNTO DE ENTRADA ---
  def main do
    lista = [1,6,10,3,2]
    IO.inspect(lista, label: "Lista original")
    IO.inspect(mayor_elemento(lista), label: "Mayor elemento")

    IO.puts("\n--- Pruebas adicionales ---")
    probar_funciones()
  end


  @doc """
  Devuelve el mayor elemento de una lista.
  Retorna `nulo` si la lista está vacía.
  """
  def mayor_elemento([]), do: nil
  def mayor_elemento([x]), do: x

  def mayor_elemento(lista) when is_list(lista) and length(lista) > 1 do
    mitad = div(length(lista), 2)
    {izq, der} = Enum.split(lista, mitad)
    |> then(&IO.inspect(&1, label: "División"))

    mayor_izq = mayor_elemento(izq)
    mayor_der = mayor_elemento(der)

    cond do
      mayor_izq == nil -> mayor_der
      mayor_der == nil -> mayor_izq
      mayor_izq > mayor_der -> mayor_izq
      true -> mayor_der
    end
  end

  # --- ORDENAMIENTO DESCENDENTE (Merge Sort) ---

  @doc """
  Ordena una lista de mayor a menor usando Merge Sort recursivo.
  """
  def ordenar_lista_mayor([]), do: []
  def ordenar_lista_mayor([x]), do: [x]

  def ordenar_lista_mayor(lista) when is_list(lista) and length(lista) > 1 do
    mitad = div(length(lista), 2)
    {izq, der} = Enum.split(lista, mitad)

    lista_izq = ordenar_lista_mayor(izq)
    lista_der = ordenar_lista_mayor(der)

    fusionar_listas_mayor(lista_izq, lista_der)
  end


  @doc """
  Fusiona dos listas ordenadas (de mayor a menor) en una sola lista ordenada.
  """
  def fusionar_listas_mayor([], lista_der), do: lista_der
  def fusionar_listas_mayor(lista_izq, []), do: lista_izq

  def fusionar_listas_mayor([x | xs], [y | ys]) when x >= y do
    [x | fusionar_listas_mayor(xs, [y | ys])]
  end

  def fusionar_listas_mayor([x | xs], [y | ys]) when x < y do
    [y | fusionar_listas_mayor([x | xs], ys)]
  end

  # --- FUNCIÓN DE PRUEBAS ---

  defp probar_funciones do
    pruebas = [
      [5, 2, 9, 1, 5, 6],
      [],
      [42],
      [3, 3, 3],
      [10, -2, 0, 7, 100]
    ]

    Enum.each(pruebas, fn lista ->
      IO.puts("\n--- Probando con: #{inspect(lista)} ---")
      IO.inspect(mayor_elemento(lista), label: "Mayor")
      IO.inspect(ordenar_lista_mayor(lista), label: "Ordenado (desc)")
    end)
  end
end

# Ejecutar
IV.main()
