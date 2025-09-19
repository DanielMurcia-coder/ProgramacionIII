defmodule Tuplas do
  def main do
    tupla={:ok,"éxito",200}
    elem(tupla,1) |> IO.inspect
    nueva_tupla=put_elem(tupla,2,404)
    nueva_tupla |> IO.inspect
  end
end
Tuplas.main()
