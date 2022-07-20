defmodule OportunidadesWeb.ClienteController do
  use OportunidadesWeb, :controller

  alias Oportunidades.Cliente, as: ClienteRepo
  alias Oportunidades.Comercial.Cliente

  action_fallback OportunidadesWeb.FallbackController

  def index(conn, _params) do
    cliente = ClienteRepo.list_cliente()
    render(conn, "index.json", cliente: cliente)
  end

  def create(conn, cliente_params) do
    with {:ok, %Cliente{} = cliente} <- ClienteRepo.create_cliente(cliente_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.cliente_path(conn, :show, cliente))
      |> render("cliente.json", cliente: cliente)
    end
  end

  def show(conn, %{"id" => id}) do
    cliente = ClienteRepo.get_cliente!(id)
    render(conn, "cliente.json", cliente: cliente)
  end

  def update(conn, cliente_params) do
    cliente = ClienteRepo.get_cliente!(cliente_params["id"])

    with {:ok, %Cliente{} = cliente} <- ClienteRepo.update_cliente(cliente, cliente_params) do
      render(conn, "cliente.json", cliente: cliente)
    end
  end

  def delete(conn, %{"id" => id}) do
    cliente = ClienteRepo.get_cliente!(id)

    with {:ok, %Cliente{}} <- ClienteRepo.delete_cliente(cliente) do
      send_resp(conn, :no_content, "")
    end
  end
end
