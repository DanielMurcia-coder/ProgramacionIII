defmodule Util do
  @moduledoc """
  Módulo con funciones que se reutilizan
  - autor: Johan Sebastian Echeverri Ibarra
  - fecha: 19 Agosto 2025
  - licencia: GNU GPL v3
  """
  
  @doc """
  Función para mostrar un mensaje en la pantalla con Java
  ## Parámetro
    - mensaje: texto que se le presenta al usuario
  """
  def mostrar_mensaje_Java(mensaje) do
    System.cmd("java", ["-cp", ".", "Mensaje", mensaje])
  end

  @doc """
  Función para mostrar un mensaje
  ## Parámetro
    - mensaje: texto que se le presenta al usuario
  """
  def mostrar_mensaje(mensaje) do
    IO.puts(mensaje)
  end

  @doc """
  Función para ingresar datos desde la terminal.
  ## Parámetros
    - mensaje: texto que se muestra al usuario
    - tipo: :texto, :entero o :real

  ## Ejemplos
      Util.ingresar("Nombre: ", :texto)
      Util.ingresar("Edad: ", :entero)
      Util.ingresar("Precio: ", :real)
  """
  def ingresar(mensaje, tipo)

  @doc false
  def ingresar(mensaje, :texto) do
    mensaje
    |> IO.gets()
    |> String.trim()
  end

  @doc false
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

  @doc false
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

  @doc """
  Función para ingresar un String con Java
  ## Parámetro
    - mensaje: texto que ingresa el usuario
  """
  def ingresar_Java(mensaje, :texto) do
    # Llama al programa Java para ingresar texto y capturar la entrada
    case System.cmd("java", ["-cp", ".", "Mensaje", "input", mensaje]) do
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
  Función para mostrar un mensaje de error
  ## Parámetro
    - mensaje: texto de error que le aparece al usuario
  """
  def mostrar_error(mensaje) do
    IO.puts(:standard_error, mensaje)
  end

  # --- Funciones adicionales del otro Util que no estaban en este ---

  @doc """
  Cuenta la longitud de un mensaje sin contar los espacios en blanco.
  """
  def cntr_longitud_sin_espacios(mensaje) do
    mensaje
    |> String.replace(" ", "")
    |> String.length()
  end

  @doc """
  Convierte un mensaje a mayúsculas sostenidas.
  """
  def conv_mayus_sostenida(mensaje) do
    String.upcase(mensaje)
  end

  @doc """
  Muestra un popup usando un programa Java externo (PopUp.class).
  """
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

  def ingresar(mensaje, :boolean) do
    valor =
    mensaje
    |> ingresar(:texto)
    |> String.downcase()
    Enum.member?(["si", "sí", "s"], valor)
  end

end
