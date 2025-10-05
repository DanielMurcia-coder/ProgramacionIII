defmodule QuizII do
  def main do
    lista= [3, 1, 4, 1, 9]
    IO.puts("La lista es:")
    IO.inspect(lista)
    IO.puts("El mayor elemento es:")
    IO.inspect mayor_elemento(lista)
  end

  def mayor_elemento([]), do: nil
  def mayor_elemento([x]), do: x

  def mayor_elemento(lista) when is_list(lista)  and length(lista) > 1 do
    mitad= div(length(lista),2)
    {izq,der}= Enum.split(lista, mitad)
    mayor_izq=mayor_elemento(izq)
    mayor_der=mayor_elemento(der)
    cond do
      mayor_izq==nil -> mayor_der
      mayor_der==nil -> mayor_izq
      mayor_izq>mayor_der -> mayor_izq
      true -> mayor_der
    end

  end
end
QuizII.main()
