defmodule OportunidadesWeb.ProdutoView do
  use OportunidadesWeb, :view
  alias OportunidadesWeb.ProdutoView

  def render("produtos.json", %{produto: produto}) do
     render_many(produto, ProdutoView, "produto.json")
  end

  def render("show.json", %{produto: produto}) do
     render_one(produto, ProdutoView, "produto.json")
  end

  def render("produto.json", %{produto: produto}) do
    %{
      id: produto.id,
      nome: produto.nome,
      valor: produto.valor,
      tipo: produto.tipo
    }
  end
end
