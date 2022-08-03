defmodule OportunidadesWeb.OportunidadeControllerTest do
  use OportunidadesWeb.ConnCase

  import Oportunidades.NegociosFixtures

  alias Oportunidades.Negocios.Oportunidade

  @create_attrs %{
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
  }
  @update_attrs %{
    data_conclusao: ~D[2022-08-03],
    motivoPerda: "some updated motivoPerda",
    nome: "some updated nome",
    observacao: "some updated observacao",
    previsao_venda: ~D[2022-08-03],
    probabilidade: 43,
    sequencia: 43,
    situacao: 43,
    total_anual: "456.7",
    total_mensal: "456.7",
    total_unico: "456.7"
  }
  @invalid_attrs %{data_conclusao: nil, motivoPerda: nil, nome: nil, observacao: nil, previsao_venda: nil, probabilidade: nil, sequencia: nil, situacao: nil, total_anual: nil, total_mensal: nil, total_unico: nil}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all oportunidades", %{conn: conn} do
      conn = get(conn, Routes.oportunidade_path(conn, :index))
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create oportunidade" do
    test "renders oportunidade when data is valid", %{conn: conn} do
      conn = post(conn, Routes.oportunidade_path(conn, :create), oportunidade: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, Routes.oportunidade_path(conn, :show, id))

      assert %{
               "id" => ^id,
               "data_conclusao" => "2022-08-02",
               "motivoPerda" => "some motivoPerda",
               "nome" => "some nome",
               "observacao" => "some observacao",
               "previsao_venda" => "2022-08-02",
               "probabilidade" => 42,
               "sequencia" => 42,
               "situacao" => 42,
               "total_anual" => "120.5",
               "total_mensal" => "120.5",
               "total_unico" => "120.5"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.oportunidade_path(conn, :create), oportunidade: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update oportunidade" do
    setup [:create_oportunidade]

    test "renders oportunidade when data is valid", %{conn: conn, oportunidade: %Oportunidade{id: id} = oportunidade} do
      conn = put(conn, Routes.oportunidade_path(conn, :update, oportunidade), oportunidade: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, Routes.oportunidade_path(conn, :show, id))

      assert %{
               "id" => ^id,
               "data_conclusao" => "2022-08-03",
               "motivoPerda" => "some updated motivoPerda",
               "nome" => "some updated nome",
               "observacao" => "some updated observacao",
               "previsao_venda" => "2022-08-03",
               "probabilidade" => 43,
               "sequencia" => 43,
               "situacao" => 43,
               "total_anual" => "456.7",
               "total_mensal" => "456.7",
               "total_unico" => "456.7"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, oportunidade: oportunidade} do
      conn = put(conn, Routes.oportunidade_path(conn, :update, oportunidade), oportunidade: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete oportunidade" do
    setup [:create_oportunidade]

    test "deletes chosen oportunidade", %{conn: conn, oportunidade: oportunidade} do
      conn = delete(conn, Routes.oportunidade_path(conn, :delete, oportunidade))
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, Routes.oportunidade_path(conn, :show, oportunidade))
      end
    end
  end

  defp create_oportunidade(_) do
    oportunidade = oportunidade_fixture()
    %{oportunidade: oportunidade}
  end
end
