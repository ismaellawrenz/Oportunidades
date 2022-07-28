defmodule OportunidadesWeb.EtapaControllerTest do
  use OportunidadesWeb.ConnCase

  import Oportunidades.EtapasFixtures

  alias Oportunidades.Etapas.Etapa

  @create_attrs %{
    descricao: "some descricao",
    sequencia: 42
  }
  @update_attrs %{
    descricao: "some updated descricao",
    sequencia: 43
  }
  @invalid_attrs %{descricao: nil, sequencia: nil}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all etapas", %{conn: conn} do
      conn = get(conn, Routes.etapa_path(conn, :index))
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create etapa" do
    test "renders etapa when data is valid", %{conn: conn} do
      conn = post(conn, Routes.etapa_path(conn, :create), etapa: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, Routes.etapa_path(conn, :show, id))

      assert %{
               "id" => ^id,
               "descricao" => "some descricao",
               "sequencia" => 42
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.etapa_path(conn, :create), etapa: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update etapa" do
    setup [:create_etapa]

    test "renders etapa when data is valid", %{conn: conn, etapa: %Etapa{id: id} = etapa} do
      conn = put(conn, Routes.etapa_path(conn, :update, etapa), etapa: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, Routes.etapa_path(conn, :show, id))

      assert %{
               "id" => ^id,
               "descricao" => "some updated descricao",
               "sequencia" => 43
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, etapa: etapa} do
      conn = put(conn, Routes.etapa_path(conn, :update, etapa), etapa: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete etapa" do
    setup [:create_etapa]

    test "deletes chosen etapa", %{conn: conn, etapa: etapa} do
      conn = delete(conn, Routes.etapa_path(conn, :delete, etapa))
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, Routes.etapa_path(conn, :show, etapa))
      end
    end
  end

  defp create_etapa(_) do
    etapa = etapa_fixture()
    %{etapa: etapa}
  end
end
