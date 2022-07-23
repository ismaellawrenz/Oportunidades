defmodule Oportunidades.ProdutosFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Oportunidades.Produtos` context.
  """

  @doc """
  Generate a produto.
  """
  def produto_fixture(attrs \\ %{}) do
    {:ok, produto} =
      attrs
      |> Enum.into(%{
        nome: "some nome",
        tipo: 42,
        valor: "120.5"
      })
      |> Oportunidades.Produtos.create_produto()

    produto
  end
end
