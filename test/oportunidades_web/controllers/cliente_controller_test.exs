defmodule OportunidadesWeb.ClienteControllerTest do
  use OportunidadesWeb.ConnCase

  import Oportunidades.ComercialFixtures

  alias Oportunidades.Comercial.Cliente

  @create_attrs %{
    cnpj: "some cnpj",
    emails: [],
    nome: "some nome",
    nomeFantasia: "some nomeFantasia",
    origem: 42,
    origemDescricao: "some origemDescricao",
    telefones: []
  }
  @update_attrs %{
    cnpj: "some updated cnpj",
    emails: [],
    nome: "some updated nome",
    nomeFantasia: "some updated nomeFantasia",
    origem: 43,
    origemDescricao: "some updated origemDescricao",
    telefones: []
  }
  @invalid_attrs %{cnpj: nil, emails: nil, nome: nil, nomeFantasia: nil, origem: nil, origemDescricao: nil, telefones: nil}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all cliente", %{conn: conn} do
      conn = get(conn, Routes.cliente_path(conn, :index))
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create cliente" do
    test "renders cliente when data is valid", %{conn: conn} do
      conn = post(conn, Routes.cliente_path(conn, :create), cliente: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, Routes.cliente_path(conn, :show, id))

      assert %{
               "id" => ^id,
               "cnpj" => "some cnpj",
               "emails" => [],
               "nome" => "some nome",
               "nomeFantasia" => "some nomeFantasia",
               "origem" => 42,
               "origemDescricao" => "some origemDescricao",
               "telefones" => []
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.cliente_path(conn, :create), cliente: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update cliente" do
    setup [:create_cliente]

    test "renders cliente when data is valid", %{conn: conn, cliente: %Cliente{id: id} = cliente} do
      conn = put(conn, Routes.cliente_path(conn, :update, cliente), cliente: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, Routes.cliente_path(conn, :show, id))

      assert %{
               "id" => ^id,
               "cnpj" => "some updated cnpj",
               "emails" => [],
               "nome" => "some updated nome",
               "nomeFantasia" => "some updated nomeFantasia",
               "origem" => 43,
               "origemDescricao" => "some updated origemDescricao",
               "telefones" => []
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, cliente: cliente} do
      conn = put(conn, Routes.cliente_path(conn, :update, cliente), cliente: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete cliente" do
    setup [:create_cliente]

    test "deletes chosen cliente", %{conn: conn, cliente: cliente} do
      conn = delete(conn, Routes.cliente_path(conn, :delete, cliente))
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, Routes.cliente_path(conn, :show, cliente))
      end
    end
  end

  defp create_cliente(_) do
    cliente = cliente_fixture()
    %{cliente: cliente}
  end
end
