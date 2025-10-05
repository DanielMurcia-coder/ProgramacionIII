defmodule I do
  def main do
    n = "Ingrese un número entero positivo para calcular la sumatoria: "
    |> Util.ingresar(:entero)
    resultado = sigma(n)
    mensaje = "La suma de los primeros #{n} números es: #{resultado}"
    |> Util.mostrar_mensaje_Java()


    n = "Ingrese un número entero positivo para calcular el factorial: "
    |> Util.ingresar(:entero)
    resultado = factorial(n)
    mensaje = "El factorial de #{n} es: #{resultado}"
    |> Util.mostrar_mensaje_Java()

    
    n = "Ingrese un número entero positivo para calcular Fibonacci: "
    |> Util.ingresar(:entero)
    resultado = fib(n)
    mensaje = "El Fibonacci de #{n} es: #{resultado}"
    |> Util.mostrar_mensaje_Java()
  end

  def sigma(0), do: 0
  def sigma(n) when n > 0 do
    n + sigma(n - 1)
  end

  def factorial(0), do: 1
  def factorial(n) when n > 0 do
    n * factorial(n - 1)
  end

  def fib(0), do: 0
  def fib(1), do: 1
  def fib(n) when n > 1 do
    fib(n - 1) + fib(n - 2)
  end

end
I.main()
