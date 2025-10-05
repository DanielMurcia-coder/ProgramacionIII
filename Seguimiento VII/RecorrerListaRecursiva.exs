defmodule RecorrerListaRecursiva do

  def main() do
    lista= [1,2,3,4,5]
    recorrer_lista(lista)
  end

  def recorrer_lista([]), do: :ok
  def recorrer_lista(lista) do
    mitad= div(length(lista),2)
    [izq,der]= Enum.split(lista,mitad)

    recorrer_lista(izq)
    |> imprimir()
    recorrer_lista(der)
    |> imprimir()
  end
  def imprimir([]), do: :ok
  def imprimir([x]), do: IO.inspect("Elemento: #{x}")

end
RecorrerListaRecursiva.main()
