defmodule OportunidadesWeb.UsuarioControllerTest do
  use OportunidadesWeb.ConnCase

  import Oportunidades.UsuariosFixtures

  alias Oportunidades.Usuarios.Usuario

  @create_attrs %{
    funcao: "some funcao",
    login: "some login",
    nome: "some nome",
    senha: "some senha",
    situacao: true
  }
  @update_attrs %{
    funcao: "some updated funcao",
    login: "some updated login",
    nome: "some updated nome",
    senha: "some updated senha",
    situacao: false
  }
  @invalid_attrs %{funcao: nil, login: nil, nome: nil, senha: nil, situacao: nil}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all usuario", %{conn: conn} do
      conn = get(conn, Routes.usuario_path(conn, :index))
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create usuario" do
    test "renders usuario when data is valid", %{conn: conn} do
      conn = post(conn, Routes.usuario_path(conn, :create), usuario: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, Routes.usuario_path(conn, :show, id))

      assert %{
               "id" => ^id,
               "funcao" => "some funcao",
               "login" => "some login",
               "nome" => "some nome",
               "senha" => "some senha",
               "situacao" => true
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.usuario_path(conn, :create), usuario: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update usuario" do
    setup [:create_usuario]

    test "renders usuario when data is valid", %{conn: conn, usuario: %Usuario{id: id} = usuario} do
      conn = put(conn, Routes.usuario_path(conn, :update, usuario), usuario: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, Routes.usuario_path(conn, :show, id))

      assert %{
               "id" => ^id,
               "funcao" => "some updated funcao",
               "login" => "some updated login",
               "nome" => "some updated nome",
               "senha" => "some updated senha",
               "situacao" => false
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, usuario: usuario} do
      conn = put(conn, Routes.usuario_path(conn, :update, usuario), usuario: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete usuario" do
    setup [:create_usuario]

    test "deletes chosen usuario", %{conn: conn, usuario: usuario} do
      conn = delete(conn, Routes.usuario_path(conn, :delete, usuario))
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, Routes.usuario_path(conn, :show, usuario))
      end
    end
  end

  defp create_usuario(_) do
    usuario = usuario_fixture()
    %{usuario: usuario}
  end
end
