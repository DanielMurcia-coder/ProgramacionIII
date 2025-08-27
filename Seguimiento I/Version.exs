defmodule Version do

  @moduledoc """
  Modulo con funciones que permiten mostrar en pantalla un mensaje
  -Autor: Daniel Esteban Murcia Trujillo
  -fecha: 19/08/2025
  -licencia: GNU GPL v3
  """

  @doc """
  Función para mostrar una ventana en la pantalla con un mensaje
  ##Parámetro
    -mensaje
  """
  def mostrar_popup(mensaje) do
    System.cmd("java", ["PopUp", mensaje])
  end

end
  #Invoca el metodo en el que crea una interfaz desde java y muestra un mensaje
Version.mostrar_popup("Bienvenidos a la empresa Once ltda.")
