defmodule OportunidadesWeb.EtapaController do
  use OportunidadesWeb, :controller

  alias Oportunidades.Etapas
  alias Oportunidades.Etapas.Etapa

  action_fallback OportunidadesWeb.FallbackController

  def index(conn, _params) do
    etapas = Etapas.list_etapas()
    render(conn, "index.json", etapas: etapas)
  end

  def create(conn, etapa_params) do
    with {:ok, %Etapa{} = etapa} <- Etapas.create_etapa(etapa_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.etapa_path(conn, :show, etapa))
      |> render("show.json", etapa: etapa)
    end
  end

  def show(conn, %{"id" => id}) do
    etapa = Etapas.get_etapa!(id)
    render(conn, "show.json", etapa: etapa)
  end

  def update(conn, etapa_params) do
    etapa = Etapas.get_etapa!(etapa_params["id"])

    with {:ok, %Etapa{} = etapa} <- Etapas.update_etapa(etapa, etapa_params) do
      render(conn, "show.json", etapa: etapa)
    end
  end

  def alterar_sequencia(conn, etapa_params) do
    with {:ok, %Etapa{} = etapa} <- Etapas.alterar_sequencia(etapa_params) do
      render(conn, "show.json", etapa: etapa)
    end
  end


  def delete(conn, %{"id" => id}) do
    etapa = Etapas.get_etapa!(id)

    with {:ok, %Etapa{}} <- Etapas.delete_etapa(etapa) do
      send_resp(conn, :no_content, "")
    end
  end
end
