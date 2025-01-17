defmodule Transformacoes do
  @menu "
  Menu das transformações

  =============

  1. Criar vértices
  2. Rotação
  3. Translação
  4. Reflexão
  5. Zoom
  6. Sair

  Entre com sua opção: "

  defp copiar_lista(lista) do
    Enum.map(lista, &(&1))
  end

  def criar(lista) do
    IO.puts("Criar")
    coordenadas =
      IO.gets("Digite os pares de coordenadas x e y: ")
      |> String.trim()
      |> String.split()
      |> Enum.map(&String.to_integer/1)
      |> Enum.chunk_every(2)

    IO.puts("Coordenadas criadas com sucesso.")
    IO.puts("Vértices:")
    IO.inspect(coordenadas ++ lista)

    coordenadas ++ copiar_lista(lista)
  end

  def ponto_rotacao([x, y], angulo) do
    x_rotacionado = (x * :math.cos(angulo)) - (y * :math.sin(angulo))
    y_rotacionado = (x * :math.sin(angulo)) + (y * :math.cos(angulo))
    [x_rotacionado, y_rotacionado]
  end

  def rotacao(lista) do
    IO.puts("Esta é a sua lista atual:")
    IO.inspect(lista)
    angulo = IO.gets("Digite o ângulo em graus:") |> String.trim() |> String.to_integer()
    angulo_em_radianos = angulo * :math.pi / 180
    
    tarefas = Enum.map(copiar_lista(lista), fn [x, y] ->
      Task.async(fn -> ponto_rotacao([x, y], angulo_em_radianos) end)
    end)

    vertices_rotacionados = Enum.map(tarefas, &Task.await/1)

    IO.puts("Rotação concluída")
    IO.inspect(vertices_rotacionados)
    vertices_rotacionados
  end

  def translacao(lista) do
    IO.puts("Translação do Polígono")
    translacao_x = IO.gets("Digite a quantidade de translação para x: ") |> String.trim() |> String.to_integer()
    translacao_y = IO.gets("Digite a quantidade de translação para y: ") |> String.trim() |> String.to_integer()

    tarefas = Enum.map(copiar_lista(lista), fn [x, y] ->
      Task.async(fn -> [x + translacao_x, y + translacao_y] end)
    end)

    nova_lista = Enum.map(tarefas, &Task.await/1)
    IO.inspect(nova_lista)
    nova_lista
  end

  def reflexao(lista) do
    IO.puts("Reflexão do Polígono")
    IO.puts("Digite o eixo de reflexão:")
    IO.puts("1. Reflexão em relação ao eixo x")
    IO.puts("2. Reflexão em relação ao eixo y")

    opcao = IO.gets(" |> ") |> String.trim() |> String.to_integer()

    tarefas =
      case opcao do
        1 ->
          Enum.map(copiar_lista(lista), fn [x, y] -> Task.async(fn -> [x, -y] end) end)

        2 ->
          Enum.map(copiar_lista(lista), fn [x, y] -> Task.async(fn -> [-x, y] end) end)

        _ ->
          IO.puts("Opção inválida.")
          Enum.map(copiar_lista(lista), &Task.async(fn -> &1 end))
      end

    nova_lista = Enum.map(tarefas, &Task.await/1)
    IO.inspect(nova_lista)
    nova_lista
  end

  def escala(lista) do
    IO.puts("Escala")
    IO.puts("Digite o fator de escala para x e y (formato: x y):")

    input = IO.gets("") |> String.trim()

    [sx_str, sy_str] = String.split(input, " ", trim: true)
    sx = String.to_float(sx_str)
    sy = String.to_float(sy_str)

    tarefas = Enum.map(copiar_lista(lista), fn [x, y] ->
      Task.async(fn -> [x * sx, y * sy] end)
    end)

    nova_lista = Enum.map(tarefas, &Task.await/1)
    IO.puts("Escala aplicada com sucesso.")
    IO.inspect(nova_lista)
    nova_lista
  end

  def principal(lista) do
    op = IO.gets(@menu)
         |> String.trim()
         |> String.to_integer()
         IO.puts("")

    case op do
      1 -> principal(criar(lista))
      2 -> principal(rotacao(lista))
      3 -> principal(translacao(lista))
      4 -> principal(reflexao(lista))
      5 -> principal(escala(lista))
      6 -> IO.puts("Até logo")
           lista
      _ -> IO.puts("Opção inválida")
           principal(lista)
    end
  end
end

Transformacoes.principal([])
