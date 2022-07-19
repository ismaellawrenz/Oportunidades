defmodule OportunidadesWeb.ClienteController do
  use OportunidadesWeb, :controller

  alias Oportunidades.Comercial
  alias Oportunidades.Comercial.Cliente

  action_fallback OportunidadesWeb.FallbackController

  def index(conn, _params) do
    cliente = Comercial.list_cliente()
    render(conn, "index.json", cliente: cliente)
  end

  def create(conn, %{"cliente" => cliente_params}) do
    with {:ok, %Cliente{} = cliente} <- Comercial.create_cliente(cliente_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.cliente_path(conn, :show, cliente))
      |> render("show.json", cliente: cliente)
    end
  end

  def show(conn, %{"id" => id}) do
    cliente = Comercial.get_cliente!(id)
    render(conn, "show.json", cliente: cliente)
  end

  def update(conn, %{"id" => id, "cliente" => cliente_params}) do
    cliente = Comercial.get_cliente!(id)

    with {:ok, %Cliente{} = cliente} <- Comercial.update_cliente(cliente, cliente_params) do
      render(conn, "show.json", cliente: cliente)
    end
  end

  def delete(conn, %{"id" => id}) do
    cliente = Comercial.get_cliente!(id)

    with {:ok, %Cliente{}} <- Comercial.delete_cliente(cliente) do
      send_resp(conn, :no_content, "")
    end
  end
end
