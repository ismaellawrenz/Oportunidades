defmodule OportunidadesWeb.OportunidadeController do
  use OportunidadesWeb, :controller

  alias Oportunidades.Negocios
  alias Oportunidades.Negocios.Oportunidade

  action_fallback OportunidadesWeb.FallbackController

  def index(conn, _params) do
    oportunidades = Negocios.list_oportunidades()
    render(conn, "index.json", oportunidades: oportunidades)
  end

  def create(conn, oportunidade_params) do
    with {:ok, %Oportunidade{} = oportunidade} <-
           Negocios.create_oportunidade(oportunidade_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.oportunidade_path(conn, :show, oportunidade))
      |> render("show.json", oportunidade: oportunidade)
    end
  end

  def show(conn, %{"id" => id}) do
    oportunidade = Negocios.get_oportunidade!(id)
    render(conn, "show.json", oportunidade: oportunidade)
  end

  def update(conn, oportunidade_params) do
    oportunidade = Negocios.get_oportunidade!(oportunidade_params["id"])

    with {:ok, %Oportunidade{} = oportunidade} <-
           Negocios.update_oportunidade(oportunidade, oportunidade_params) do
      render(conn, "show.json", oportunidade: oportunidade)
    end
  end

  def delete(conn, %{"id" => id}) do
    oportunidade = Negocios.get_oportunidade!(id)

    with {:ok, %Oportunidade{}} <- Negocios.delete_oportunidade(oportunidade) do
      send_resp(conn, :no_content, "")
    end
  end

  def alterar_sequencia(conn, oportunidade_params) do
    with {:ok, oportunidade} <- Negocios.alterar_sequencia(oportunidade_params) do
      render(conn, "show.json", oportunidade: oportunidade)
    end
  end
end
