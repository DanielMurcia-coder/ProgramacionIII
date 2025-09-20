defmodule Listas do
  def main do
    lista=[1,2,3,4,5]
    IO.inspect Enum.map(lista, fn x -> x * 2 end)
    IO.inspect Enum.filter(lista, fn x -> rem(x,2)== 1 end)
    lista_extension=[6,7,8]
    IO.inspect Enum.map(lista, fn x -> x * 2 end)
    IO.inspect Enum.filter(lista, fn x -> rem(x,2)== 1 end)
    lista_extendida=[lista|lista_extension]
    IO.inspect (lista ++lista_extension)
    IO.inspect (lista_extendida)
    [h|t]=lista_extendida
    IO.inspect h
    IO.inspect t
  end
end
Listas.main()
