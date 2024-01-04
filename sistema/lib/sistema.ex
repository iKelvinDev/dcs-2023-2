defmodule Sistema do
  @menu "
  Menu do sistema

  =============

  1. Criar
  2. Listar
  3. Atualizar
  4. Excluir
  5. Sair

  Entre com sua opção: "

  def criar(lista) do
    IO.puts("Criar")
    coordenadas = IO.gets("Digite os pares de coordenadas x e y: ") |>
    String.trim() |>
    String.split() |>
    Enum.map(&String.to_integer/1) |>
    Enum.chunk_every(2, 2, :discard)

    IO.puts("Coordenadas criadas com sucesso.")

    IO.puts("Método criar")
    IO.inspect(coordenadas ++ lista)
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

  def principal(lista) do
    op = IO.gets(@menu)
    |> String.trim()
    |> String.to_integer()

    case op do
      1 -> principal(criar(lista))
      2 -> principal(listar(lista))
      3 -> principal(alterar(lista))
      4 -> principal(excluir(lista))
      5 -> IO.puts("Até logo")
      _ -> IO.puts("Opção inválida")
          principal(lista)
    end
  end
end

Sistema.principal([])
