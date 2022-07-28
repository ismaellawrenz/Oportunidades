defmodule OportunidadesWeb.UsuarioController do
  use OportunidadesWeb, :controller

  alias Oportunidades.Usuarios
  alias Oportunidades.Usuarios.Usuario

  action_fallback OportunidadesWeb.FallbackController

  def index(conn, _params) do
    usuario = Usuarios.list_usuario()
    render(conn, "index.json", usuario: usuario)
  end

  def create(conn, usuario_params) do
    with {:ok, %Usuario{} = usuario} <- Usuarios.create_usuario(usuario_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.usuario_path(conn, :show, usuario))
      |> render("show.json", usuario: usuario)
    end
  end

  def show(conn, %{"id" => id}) do
    usuario = Usuarios.get_usuario!(id)
    render(conn, "show.json", usuario: usuario)
  end

  def update(conn, usuario_params) do
    usuario = Usuarios.get_usuario!(usuario_params["id"])

    with {:ok, %Usuario{} = usuario} <- Usuarios.update_usuario(usuario, usuario_params) do
      render(conn, "show.json", usuario: usuario)
    end
  end

  def delete(conn, %{"id" => id}) do
    usuario = Usuarios.get_usuario!(id)

    with {:ok, %Usuario{}} <- Usuarios.delete_usuario(usuario) do
      send_resp(conn, :no_content, "")
    end
  end
end
