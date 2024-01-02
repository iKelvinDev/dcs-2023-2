defmodule Q6 do

  def ler_e_armazenar(n) do
    matriculas_nomes = ler_matriculas_nomes(n)
    dicionario = Enum.into(matriculas_nomes, %{})
    IO.inspect(dicionario)
  end

  defp ler_matriculas_nomes(n) do
    IO.puts("Digite os pares matrícula/nome (um por linha): ")
    Enum.map(1..n, fn _ ->
      {matricula, nome} = ler_matricula_nome()
      {matricula, nome}
    end)
  end

  defp ler_matricula_nome do
    IO.puts("Matrícula: ")
    matricula = IO.gets("") |> String.trim()

    IO.puts("Nome:")
    nome = IO.gets("") |> String.trim()

    {matricula, nome}
  end
end

IO.puts("Digite a quantidade de pares matrícula/nome: ")
quantidade = IO.gets("") |> String.trim() |> String.to_integer()

Q6.ler_e_armazenar(quantidade)

end
