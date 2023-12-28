defmodule Q5 do

  def ler_e_exibir_ordem_inversa do
    IO.puts("Digite a quantidade de números:")
    quantidade = IO.gets("") |> String.trim() |> String.to_integer()

    IO.puts("Digite a sequência de #{quantidade} números inteiros (um por linha):")
    numeros = Enum.map(1..quantidade, fn _ ->
      IO.gets("") |> String.trim() |> String.to_integer()
    end)

    inverso = Enum.reverse(numeros)
    IO.puts("Sequência inversa: #{inverso}")
  end

end
