defmodule Q4 do

  def calcular_imc do
    IO.puts("Digite seu nome:")
    nome = IO.gets("") |> String.trim()

    IO.puts("Digite seu peso em Kg:")
    peso = IO.gets("") |> String.trim() |> String.to_float()

    IO.puts("Digite sua altura em metros:")
    altura = IO.gets("") |> String.trim() |> String.to_float()

    imc = peso / (altura * altura)
    IO.puts("Olá #{nome}, seu IMC é de #{Float.round(imc, 1)}.")
  end

end
