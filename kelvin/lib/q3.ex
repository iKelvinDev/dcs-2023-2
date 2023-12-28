defmodule Q3 do

  # Questão 03
  def calcular_idade do
    IO.puts "Digite seu nome: "
    nome = IO.gets("") |> String.trim()

    IO.puts "Digite seu ano de nascimento: "
    ano_nascimento = IO.gets("") |> String.trim()

    idade = Date.utc_today().year() - String.to_integer(ano_nascimento)

    IO.puts "Olá #{nome}, você tem #{idade} anos."
  end

end
