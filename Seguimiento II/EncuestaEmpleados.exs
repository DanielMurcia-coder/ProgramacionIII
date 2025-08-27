defmodule EncuestaEmpleados do
  def main do
    nombre = "Nombre del Empleado: "
      |> Util.ingresar_Java(:texto)

    horas_trabajadas_str = "Horas Trabajadas: "
    |> Util.ingresar_Java(:texto)
    horas_trabajadas = String.to_integer(horas_trabajadas_str)

    valor_por_hora_str = "Valor Por Hora: "
    |> Util.ingresar_Java(:texto)
    valor_por_hora = String.to_integer(valor_por_hora_str)

    salario = calcular_salario_neto(horas_trabajadas, valor_por_hora)
    |> to_string()
    mensaje = "Empleado #{nombre} su salario neto es: #{salario}"
    |> Util.mostrar_mensaje_Java()
  end

  def calcular_salario_neto(horas_trabajadas, valor_por_hora) do
    limite = 160
    porcentaje_pago_extra = 1.25

    if horas_trabajadas > limite do
      horas_extra = horas_trabajadas - limite
      salario_base = limite * valor_por_hora
      pago_extra = horas_extra * valor_por_hora * porcentaje_pago_extra
      salario_base + pago_extra
    else
      horas_trabajadas * valor_por_hora
    end
  end
end

EncuestaEmpleados.main()
