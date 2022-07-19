defmodule OportunidadesWeb.PageController do
  use OportunidadesWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
