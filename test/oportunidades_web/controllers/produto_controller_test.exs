defmodule OportunidadesWeb.ProdutoControllerTest do
  use OportunidadesWeb.ConnCase

  import Oportunidades.ProdutosFixtures

  alias Oportunidades.Produtos.Produto

  @create_attrs %{
    nome: "some nome",
    tipo: 42,
    valor: "120.5"
  }
  @update_attrs %{
    nome: "some updated nome",
    tipo: 43,
    valor: "456.7"
  }
  @invalid_attrs %{nome: nil, tipo: nil, valor: nil}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all produto", %{conn: conn} do
      conn = get(conn, Routes.produto_path(conn, :index))
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create produto" do
    test "renders produto when data is valid", %{conn: conn} do
      conn = post(conn, Routes.produto_path(conn, :create), produto: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, Routes.produto_path(conn, :show, id))

      assert %{
               "id" => ^id,
               "nome" => "some nome",
               "tipo" => 42,
               "valor" => "120.5"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.produto_path(conn, :create), produto: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update produto" do
    setup [:create_produto]

    test "renders produto when data is valid", %{conn: conn, produto: %Produto{id: id} = produto} do
      conn = put(conn, Routes.produto_path(conn, :update, produto), produto: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, Routes.produto_path(conn, :show, id))

      assert %{
               "id" => ^id,
               "nome" => "some updated nome",
               "tipo" => 43,
               "valor" => "456.7"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, produto: produto} do
      conn = put(conn, Routes.produto_path(conn, :update, produto), produto: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete produto" do
    setup [:create_produto]

    test "deletes chosen produto", %{conn: conn, produto: produto} do
      conn = delete(conn, Routes.produto_path(conn, :delete, produto))
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, Routes.produto_path(conn, :show, produto))
      end
    end
  end

  defp create_produto(_) do
    produto = produto_fixture()
    %{produto: produto}
  end
end
