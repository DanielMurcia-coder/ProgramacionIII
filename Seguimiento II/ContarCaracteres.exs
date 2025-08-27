defmodule ContarCaracteres do
  def main do
    "Ingrese una frase:"
    |> Util.ingresar_err_exs(:texto)
    |> Util.cntr_longitud_sin_espacios()
    |> Integer.to_string()
    |> generar_mensaje()
    |> Util.mostrar_popup()
  end

  defp generar_mensaje(mensaje) do
  "La longitud de la cadena es de: " <> mensaje <> " caracteres."
  end
end


ContarCaracteres.main()
