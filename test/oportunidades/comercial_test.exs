defmodule Oportunidades.ComercialTest do
  use Oportunidades.DataCase

  alias Oportunidades.Comercial

  describe "cliente" do
    alias Oportunidades.Comercial.Cliente

    import Oportunidades.ComercialFixtures

    @invalid_attrs %{cnpj: nil, emails: nil, nome: nil, nomeFantasia: nil, origem: nil, origemDescricao: nil, telefones: nil}

    test "list_cliente/0 returns all cliente" do
      cliente = cliente_fixture()
      assert Comercial.list_cliente() == [cliente]
    end

    test "get_cliente!/1 returns the cliente with given id" do
      cliente = cliente_fixture()
      assert Comercial.get_cliente!(cliente.id) == cliente
    end

    test "create_cliente/1 with valid data creates a cliente" do
      valid_attrs = %{cnpj: "some cnpj", emails: [], nome: "some nome", nomeFantasia: "some nomeFantasia", origem: 42, origemDescricao: "some origemDescricao", telefones: []}

      assert {:ok, %Cliente{} = cliente} = Comercial.create_cliente(valid_attrs)
      assert cliente.cnpj == "some cnpj"
      assert cliente.emails == []
      assert cliente.nome == "some nome"
      assert cliente.nomeFantasia == "some nomeFantasia"
      assert cliente.origem == 42
      assert cliente.origemDescricao == "some origemDescricao"
      assert cliente.telefones == []
    end

    test "create_cliente/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Comercial.create_cliente(@invalid_attrs)
    end

    test "update_cliente/2 with valid data updates the cliente" do
      cliente = cliente_fixture()
      update_attrs = %{cnpj: "some updated cnpj", emails: [], nome: "some updated nome", nomeFantasia: "some updated nomeFantasia", origem: 43, origemDescricao: "some updated origemDescricao", telefones: []}

      assert {:ok, %Cliente{} = cliente} = Comercial.update_cliente(cliente, update_attrs)
      assert cliente.cnpj == "some updated cnpj"
      assert cliente.emails == []
      assert cliente.nome == "some updated nome"
      assert cliente.nomeFantasia == "some updated nomeFantasia"
      assert cliente.origem == 43
      assert cliente.origemDescricao == "some updated origemDescricao"
      assert cliente.telefones == []
    end

    test "update_cliente/2 with invalid data returns error changeset" do
      cliente = cliente_fixture()
      assert {:error, %Ecto.Changeset{}} = Comercial.update_cliente(cliente, @invalid_attrs)
      assert cliente == Comercial.get_cliente!(cliente.id)
    end

    test "delete_cliente/1 deletes the cliente" do
      cliente = cliente_fixture()
      assert {:ok, %Cliente{}} = Comercial.delete_cliente(cliente)
      assert_raise Ecto.NoResultsError, fn -> Comercial.get_cliente!(cliente.id) end
    end

    test "change_cliente/1 returns a cliente changeset" do
      cliente = cliente_fixture()
      assert %Ecto.Changeset{} = Comercial.change_cliente(cliente)
    end
  end
end
