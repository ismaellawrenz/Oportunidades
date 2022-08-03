defmodule Oportunidades.NegociosTest do
  use Oportunidades.DataCase

  alias Oportunidades.Negocios

  describe "oportunidades" do
    alias Oportunidades.Negocios.Oportunidade

    import Oportunidades.NegociosFixtures

    @invalid_attrs %{data_conclusao: nil, motivoPerda: nil, nome: nil, observacao: nil, previsao_venda: nil, probabilidade: nil, sequencia: nil, situacao: nil, total_anual: nil, total_mensal: nil, total_unico: nil}

    test "list_oportunidades/0 returns all oportunidades" do
      oportunidade = oportunidade_fixture()
      assert Negocios.list_oportunidades() == [oportunidade]
    end

    test "get_oportunidade!/1 returns the oportunidade with given id" do
      oportunidade = oportunidade_fixture()
      assert Negocios.get_oportunidade!(oportunidade.id) == oportunidade
    end

    test "create_oportunidade/1 with valid data creates a oportunidade" do
      valid_attrs = %{data_conclusao: ~D[2022-08-02], motivoPerda: "some motivoPerda", nome: "some nome", observacao: "some observacao", previsao_venda: ~D[2022-08-02], probabilidade: 42, sequencia: 42, situacao: 42, total_anual: "120.5", total_mensal: "120.5", total_unico: "120.5"}

      assert {:ok, %Oportunidade{} = oportunidade} = Negocios.create_oportunidade(valid_attrs)
      assert oportunidade.data_conclusao == ~D[2022-08-02]
      assert oportunidade.motivoPerda == "some motivoPerda"
      assert oportunidade.nome == "some nome"
      assert oportunidade.observacao == "some observacao"
      assert oportunidade.previsao_venda == ~D[2022-08-02]
      assert oportunidade.probabilidade == 42
      assert oportunidade.sequencia == 42
      assert oportunidade.situacao == 42
      assert oportunidade.total_anual == Decimal.new("120.5")
      assert oportunidade.total_mensal == Decimal.new("120.5")
      assert oportunidade.total_unico == Decimal.new("120.5")
    end

    test "create_oportunidade/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Negocios.create_oportunidade(@invalid_attrs)
    end

    test "update_oportunidade/2 with valid data updates the oportunidade" do
      oportunidade = oportunidade_fixture()
      update_attrs = %{data_conclusao: ~D[2022-08-03], motivoPerda: "some updated motivoPerda", nome: "some updated nome", observacao: "some updated observacao", previsao_venda: ~D[2022-08-03], probabilidade: 43, sequencia: 43, situacao: 43, total_anual: "456.7", total_mensal: "456.7", total_unico: "456.7"}

      assert {:ok, %Oportunidade{} = oportunidade} = Negocios.update_oportunidade(oportunidade, update_attrs)
      assert oportunidade.data_conclusao == ~D[2022-08-03]
      assert oportunidade.motivoPerda == "some updated motivoPerda"
      assert oportunidade.nome == "some updated nome"
      assert oportunidade.observacao == "some updated observacao"
      assert oportunidade.previsao_venda == ~D[2022-08-03]
      assert oportunidade.probabilidade == 43
      assert oportunidade.sequencia == 43
      assert oportunidade.situacao == 43
      assert oportunidade.total_anual == Decimal.new("456.7")
      assert oportunidade.total_mensal == Decimal.new("456.7")
      assert oportunidade.total_unico == Decimal.new("456.7")
    end

    test "update_oportunidade/2 with invalid data returns error changeset" do
      oportunidade = oportunidade_fixture()
      assert {:error, %Ecto.Changeset{}} = Negocios.update_oportunidade(oportunidade, @invalid_attrs)
      assert oportunidade == Negocios.get_oportunidade!(oportunidade.id)
    end

    test "delete_oportunidade/1 deletes the oportunidade" do
      oportunidade = oportunidade_fixture()
      assert {:ok, %Oportunidade{}} = Negocios.delete_oportunidade(oportunidade)
      assert_raise Ecto.NoResultsError, fn -> Negocios.get_oportunidade!(oportunidade.id) end
    end

    test "change_oportunidade/1 returns a oportunidade changeset" do
      oportunidade = oportunidade_fixture()
      assert %Ecto.Changeset{} = Negocios.change_oportunidade(oportunidade)
    end
  end
end
