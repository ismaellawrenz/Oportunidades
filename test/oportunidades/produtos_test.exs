defmodule Oportunidades.ProdutosTest do
  use Oportunidades.DataCase

  alias Oportunidades.Produtos

  describe "produto" do
    alias Oportunidades.Produtos.Produto

    import Oportunidades.ProdutosFixtures

    @invalid_attrs %{nome: nil, tipo: nil, valor: nil}

    test "list_produto/0 returns all produto" do
      produto = produto_fixture()
      assert Produtos.list_produto() == [produto]
    end

    test "get_produto!/1 returns the produto with given id" do
      produto = produto_fixture()
      assert Produtos.get_produto!(produto.id) == produto
    end

    test "create_produto/1 with valid data creates a produto" do
      valid_attrs = %{nome: "some nome", tipo: 42, valor: "120.5"}

      assert {:ok, %Produto{} = produto} = Produtos.create_produto(valid_attrs)
      assert produto.nome == "some nome"
      assert produto.tipo == 42
      assert produto.valor == Decimal.new("120.5")
    end

    test "create_produto/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Produtos.create_produto(@invalid_attrs)
    end

    test "update_produto/2 with valid data updates the produto" do
      produto = produto_fixture()
      update_attrs = %{nome: "some updated nome", tipo: 43, valor: "456.7"}

      assert {:ok, %Produto{} = produto} = Produtos.update_produto(produto, update_attrs)
      assert produto.nome == "some updated nome"
      assert produto.tipo == 43
      assert produto.valor == Decimal.new("456.7")
    end

    test "update_produto/2 with invalid data returns error changeset" do
      produto = produto_fixture()
      assert {:error, %Ecto.Changeset{}} = Produtos.update_produto(produto, @invalid_attrs)
      assert produto == Produtos.get_produto!(produto.id)
    end

    test "delete_produto/1 deletes the produto" do
      produto = produto_fixture()
      assert {:ok, %Produto{}} = Produtos.delete_produto(produto)
      assert_raise Ecto.NoResultsError, fn -> Produtos.get_produto!(produto.id) end
    end

    test "change_produto/1 returns a produto changeset" do
      produto = produto_fixture()
      assert %Ecto.Changeset{} = Produtos.change_produto(produto)
    end
  end
end
