defmodule EcoMensaje do

  def main do
    "Ingrese una frase:"
    |> Util.ingresar_err_exs(:texto)
    |> Util.conv_mayus_sostenida()
    |> Util.mostrar_popup()
  end



end

EcoMensaje.main()
