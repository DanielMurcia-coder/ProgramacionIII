defmodule Util do
  @moduledoc """
  Módulo con funciones que se reutilizan
  - autor: Daniel Esteban Murcia Trujillo
  - fecha: 19/08/2025
  - licencia: GNU GPL v3
  """

  def ingresar_err_exs(mensaje,:texto) do
    case System.cmd("java", ["-cp", ".", "Mensaje","input", mensaje]) do
      {output, 0} ->
        IO.puts("Texto ingresado correctamente.")
        IO.puts("Entrada: #{output}")
        String.trim(output) # Retorna la entrada sin espacios extra
      {error, code} ->
        IO.puts("Error al ingresar el texto. Código: #{code}")
        IO.puts("Detalles: #{error}")
        nil
    end
  end

@doc """
Función para ingresar un numero real
## Parámetro
  - mensaje: texto que ingresa el usuario
"""
  def ingresar(mensaje, :real) do
  try do
    mensaje
    |> ingresar(:texto)
    |> String.to_float()
  rescue
    ArgumentError ->
      "Error, se espera que ingrese un número real\n"
      |> mostrar_error()

      mensaje
      |> ingresar(:real)
    end
  end

  def ingresar(mensaje, :texto) do
    mensaje
    |> IO.gets()
    |> String.trim()
  end

  def ingresar(mensaje, :entero) do
    try do
      mensaje
      |> ingresar(:texto)
      |> String.to_integer()
    rescue
      ArgumentError ->
        "Error, se espera que ingrese un número entero\n"
        |> mostrar_error()
        mensaje
        |> ingresar(:entero)
    end
  end

  def mostrar_error(mensaje) do
    IO.puts(:standard_error, mensaje)
  end

  def cntr_longitud_sin_espacios(mensaje) do
    mensaje
    |> String.replace(" ", "")
    |> String.length()
  end

  def conv_mayus_sostenida(mensaje) do
    mensaje
    |> String.upcase()
  end

  def mostrar_popup(mensaje) do
    case System.cmd("java", ["-cp", ".", "PopUp", mensaje]) do
      {_, 0} ->
        IO.puts("Popup mostrado con éxito.")
        :ok
      {error, code} ->
        IO.puts("Error al mostrar el popup. Código: #{code}")
        IO.puts("Detalles: #{error}")
        :error
    end
  end

  @doc """
  Función para mostrar un mensaje en la terminal
  ##Parámetro
    -mensaje
  """
  def mostrar_mensaje_exs(mensaje) do
    mensaje
    |> IO.puts()
  end

  @doc """
  Función para recibir una cadena desde la terminal
  ##Parámetro
    -mensaje
  """
  def ingresar_exs(mensaje, :texto) do
    mensaje
    |> IO.gets()
    |> String.trim()
  end

  @doc """
Función para ingresar un String con Java
## Parámetro
  - mensaje: texto que ingresa el usuario
"""
  def ingresar_Java(mensaje,:texto) do
  # Llama al programa Java para ingresar texto y capturar la entrada
    case System.cmd("java", ["-cp", ".", "Mensaje","input", mensaje]) do
      {output, 0} ->
        IO.puts("Texto ingresado correctamente.")
        IO.puts("Entrada: #{output}")
        String.trim(output) # Retorna la entrada sin espacios extra
      {error, code} ->
        IO.puts("Error al ingresar el texto. Código: #{code}")
        IO.puts("Detalles: #{error}")
      nil #!null
    end
  end

  @doc """
Función para mostrar un mensaje en la pantalla con Java
## Parámetro
  - mensaje: texto que se le presenta al usuario
"""
  def mostrar_mensaje_Java(mensaje) do
    System.cmd("java", ["-cp", ".", "Mensaje", mensaje])
  end
end
