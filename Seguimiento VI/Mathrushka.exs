defmodule Mathrushka do
  @moduledoc """
  Documentation for `Mathrushka`.
  """

  @doc """
  Hello world.

  ## Examples

      iex> Mathrushka.hello()
      :world
  """
  def main do
    n_matrioshkas = IO.gets("Ingrese el número de Matrioshkas: ") |> String.trim() |> String.to_integer()
    |> abrir_cerrar()
  end

  def abrir_cerrar(0), do: :ok
  def abrir_cerrar(n) do
  IO.puts("Abriendo Matrioshka número #{n}")
  abrir_cerrar(n - 1)   # llama recursivamente a la siguiente más pequeña
  
  IO.puts("Cerrando Matrioshka número #{n}")
  end
end

Mathrushka.main()
