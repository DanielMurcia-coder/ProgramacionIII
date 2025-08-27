defmodule EntradaDatos do
  def main do
    "Ingrese nombre del empleado: "
    |> Util.ingresar_err_exs(:texto)
    |> generar_mensaje()
    |> Util.mostrar_mensaje_exs()
  end

  defp generar_mensaje(nombre) do
  "Bienvenido #{nombre} a la empresa Once Ltda"
  end

end
EntradaDatos.main()
