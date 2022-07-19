defmodule OportunidadesWeb.ClienteView do
  use OportunidadesWeb, :view
  alias OportunidadesWeb.ClienteView

  def render("index.json", %{cliente: cliente}) do
    %{data: render_many(cliente, ClienteView, "cliente.json")}
  end

  def render("show.json", %{cliente: cliente}) do
    %{data: render_one(cliente, ClienteView, "cliente.json")}
  end

  def render("cliente.json", %{cliente: cliente}) do
    %{
      id: cliente.id,
      nome: cliente.nome,
      cnpj: cliente.cnpj,
      origemDescricao: cliente.origemDescricao,
      nomeFantasia: cliente.nomeFantasia,
      origem: cliente.origem,
      telefones: cliente.telefones,
      emails: cliente.emails
    }
  end
end
