defmodule Oportunidades.EtapasFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Oportunidades.Etapas` context.
  """

  @doc """
  Generate a etapa.
  """
  def etapa_fixture(attrs \\ %{}) do
    {:ok, etapa} =
      attrs
      |> Enum.into(%{
        descricao: "some descricao",
        sequencia: 42
      })
      |> Oportunidades.Etapas.create_etapa()

    etapa
  end
end
