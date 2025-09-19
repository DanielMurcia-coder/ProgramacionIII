defmodule CalcularSalario do
  def main do
    nombre = "Nombre del Empleado: "
    |> Util.ingresar_exs(:texto)

    horas_trabajadas = "Horas trabajadas: "
    |> Util.ingresar(:real)

    horas_extras_trabajadas = "Horas extras trabajadas: "
    |> Util.ingresar(:real)

    salario_base = "Salario base: "
    |> Util.ingresar(:real)

    salario_total = calcular_salario_total(salario_base, horas_extras_trabajadas, horas_trabajadas)
    mensaje = "Empleado #{nombre} su salario total es: #{salario_total}"
    |> Util.mostrar_mensaje_Java()
  end

  def calcular_salario_total(salario_base, horas_extras_trabajadas, horas_trabajadas ) do
    salario_total=((salario_base/horas_trabajadas)*1.5*horas_extras_trabajadas) + salario_base
  end
end

CalcularSalario.main()
