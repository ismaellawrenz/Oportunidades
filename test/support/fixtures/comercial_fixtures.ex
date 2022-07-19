defmodule Oportunidades.ComercialFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Oportunidades.Comercial` context.
  """

  @doc """
  Generate a cliente.
  """
  def cliente_fixture(attrs \\ %{}) do
    {:ok, cliente} =
      attrs
      |> Enum.into(%{
        cnpj: "some cnpj",
        emails: [],
        nome: "some nome",
        nomeFantasia: "some nomeFantasia",
        origem: 42,
        origemDescricao: "some origemDescricao",
        telefones: []
      })
      |> Oportunidades.Comercial.create_cliente()

    cliente
  end
end
