defmodule Oportunidades.NegociosFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Oportunidades.Negocios` context.
  """

  @doc """
  Generate a oportunidade.
  """
  def oportunidade_fixture(attrs \\ %{}) do
    {:ok, oportunidade} =
      attrs
      |> Enum.into(%{
        data_conclusao: ~D[2022-08-02],
        motivoPerda: "some motivoPerda",
        nome: "some nome",
        observacao: "some observacao",
        previsao_venda: ~D[2022-08-02],
        probabilidade: 42,
        sequencia: 42,
        situacao: 42,
        total_anual: "120.5",
        total_mensal: "120.5",
        total_unico: "120.5"
      })
      |> Oportunidades.Negocios.create_oportunidade()

    oportunidade
  end
end
