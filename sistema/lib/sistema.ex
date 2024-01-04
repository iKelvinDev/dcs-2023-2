defmodule Sistema do
  @menu "
  Menu do sistema

  =============

  1. Criar
  2. Listar
  3. Atualizar
  4. Excluir
  5. Translação
  6. Sair

  Entre com sua opção: "

  def criar(lista) do
    IO.puts("Criar")
    coordenadas =
      IO.gets("Digite os pares de coordenadas x e y: ")
      |> String.trim()
      |> String.split(" ")
      |> Enum.chunk_every(2)
      |> Enum.map(fn [x, y] -> [String.to_integer(x), String.to_integer(y)] end)

    IO.puts("Coordenadas criadas com sucesso.")
    IO.inspect(coordenadas)

    coordenadas ++ lista
  end

  def listar(lista) do
    IO.puts("Listar")

    Enum.each(lista, fn coordenadas ->
      IO.inspect(coordenadas)
    end)

    IO.puts("Método listar")
    IO.inspect(lista)
    lista
  end

  def alterar(lista) do
    IO.puts("Alterar")

    [x, y] = IO.gets("Digite o par que você deseja alterar (formato: x y):") |> String.trim |> String.split() |> Enum.map(&String.to_integer/1)

    indice = Enum.find_index(lista, fn v -> v == [x, y] end)
    #indice =
    IO.inspect(indice)

    [a, b] = IO.gets("Digite o novo par (formato: x y):") |> String.trim |> String.split() |> Enum.map(&String.to_integer/1)

    IO.inspect([a, b])
    nova_lista = List.replace_at(lista, indice, [a, b])
    lista = nova_lista

    lista
  end

  def excluir(lista) do
    IO.puts("Excluir")

    IO.puts("Digite o par que você deseja excluir (formato: x y):")
    [x, y] = IO.gets("") |> String.trim() |> String.split() |> Enum.map(&String.to_integer/1)

    ponto = [x, y]

    nova_lista = List.delete(lista, ponto)

    lista = nova_lista
    lista
  end

  def translacao(lista) do
    IO.puts("Translação do Polígono")
    translacao_x = IO.gets("Digite a quantidade de translação para x: ") |> String.trim() |> String.to_integer()
    translacao_y = IO.gets("Digite a quantidade de translação para y: ") |> String.trim() |> String.to_integer()

    nova_lista = Enum.map(lista, fn [x, y] -> [x + translacao_x, y + translacao_y] end)

    nova_lista
  end

  def principal(lista) do
    op = IO.gets(@menu)
    |> String.trim()
    |> String.to_integer()

    case op do
      1 -> principal(criar(lista))
      2 -> principal(listar(lista))
      3 -> principal(alterar(lista))
      4 -> principal(excluir(lista))
      5 -> principal(translacao(lista))
      6 -> IO.puts("Até logo")
      _ -> IO.puts("Opção inválida")
          principal(lista)
    end
  end
end

Sistema.principal([])
