defmodule Caneria do
  def main do

  end

  def calcular_edad_valida?(cedula) do
      cedula % 1991 == 0
  end
end
Caneria.main()
