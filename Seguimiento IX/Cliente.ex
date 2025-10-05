defmodule Cliente do
  defstruct nombre: "", edad: 0, altura: 0.0

  def crear(nombre, edad, altura) do
    %Cliente{nombre: nombre, edad: edad, altura: altura}
  end

  def main do
    "Ingrese los datos del cliente:"
    |> Util.mostrar_mensaje()

    cliente = ingresar()
    cliente
    |> generar_mensaje()
    |> Util.mostrar_mensaje()
  end

  def generar_mensaje(cliente) do
    altura = cliente.altura |> Float.round(2)
    "Hola #{cliente.nombre}, tu edad es #{cliente.edad} años y " <>
    "tienes una altura de #{altura} metros."
  end

  def ingresar() do
    nombre = "Ingrese el nombre del cliente: "
            |> Util.ingresar(:texto)

    edad = "Ingrese la edad del cliente: "
          |> Util.ingresar(:entero)

    altura = "Ingrese la altura del cliente (en metros): "
            |> Util.ingresar(:real)

    crear(nombre, edad, altura)
  end

  def ingresar(mensaje, :clientes) do
    mensaje
    |> ingresar([], :clientes)
  end

  defp ingresar(mensaje, lista, :clientes) do
    cliente =
      mensaje
      |> ingresar()

      nueva_lista = lista ++ [cliente]

    mas_clientes =
      "\nIngresar más clientes (s/n): "
      |> Util.ingresar(:boolean)
    case mas_clientes do
    true ->
      mensaje
      |> ingresar(nueva_lista, :clientes)
    false ->
      nueva_lista
    end
  end

end

Cliente.main()
