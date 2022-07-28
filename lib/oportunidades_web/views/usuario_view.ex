defmodule OportunidadesWeb.UsuarioView do
  use OportunidadesWeb, :view
  alias OportunidadesWeb.UsuarioView

  def render("index.json", %{usuario: usuario}) do
     render_many(usuario, UsuarioView, "usuario.json")
  end

  def render("show.json", %{usuario: usuario}) do
     render_one(usuario, UsuarioView, "usuario.json")
  end

  def render("usuario.json", %{usuario: usuario}) do
    %{
      id: usuario.id,
      nome: usuario.nome,
      login: usuario.login,
      funcao: usuario.funcao,
      situacao: usuario.situacao
    }
  end
end
