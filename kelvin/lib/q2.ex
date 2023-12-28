defmodule Q2 do

  # Questão 02
  def ola_nome do
    IO.puts "Digite seu nome: "
    nome = IO.gets("") |> String.trim()
    IO.puts "Olá #{nome}!"
  end

end
