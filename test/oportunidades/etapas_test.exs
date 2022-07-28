defmodule Oportunidades.EtapasTest do
  use Oportunidades.DataCase

  alias Oportunidades.Etapas

  describe "etapas" do
    alias Oportunidades.Etapas.Etapa

    import Oportunidades.EtapasFixtures

    @invalid_attrs %{descricao: nil, sequencia: nil}

    test "list_etapas/0 returns all etapas" do
      etapa = etapa_fixture()
      assert Etapas.list_etapas() == [etapa]
    end

    test "get_etapa!/1 returns the etapa with given id" do
      etapa = etapa_fixture()
      assert Etapas.get_etapa!(etapa.id) == etapa
    end

    test "create_etapa/1 with valid data creates a etapa" do
      valid_attrs = %{descricao: "some descricao", sequencia: 42}

      assert {:ok, %Etapa{} = etapa} = Etapas.create_etapa(valid_attrs)
      assert etapa.descricao == "some descricao"
      assert etapa.sequencia == 42
    end

    test "create_etapa/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Etapas.create_etapa(@invalid_attrs)
    end

    test "update_etapa/2 with valid data updates the etapa" do
      etapa = etapa_fixture()
      update_attrs = %{descricao: "some updated descricao", sequencia: 43}

      assert {:ok, %Etapa{} = etapa} = Etapas.update_etapa(etapa, update_attrs)
      assert etapa.descricao == "some updated descricao"
      assert etapa.sequencia == 43
    end

    test "update_etapa/2 with invalid data returns error changeset" do
      etapa = etapa_fixture()
      assert {:error, %Ecto.Changeset{}} = Etapas.update_etapa(etapa, @invalid_attrs)
      assert etapa == Etapas.get_etapa!(etapa.id)
    end

    test "delete_etapa/1 deletes the etapa" do
      etapa = etapa_fixture()
      assert {:ok, %Etapa{}} = Etapas.delete_etapa(etapa)
      assert_raise Ecto.NoResultsError, fn -> Etapas.get_etapa!(etapa.id) end
    end

    test "change_etapa/1 returns a etapa changeset" do
      etapa = etapa_fixture()
      assert %Ecto.Changeset{} = Etapas.change_etapa(etapa)
    end
  end
end
