defmodule OportunidadesWeb.ProdutoController do
  use OportunidadesWeb, :controller

  alias Oportunidades.Produtos
  alias Oportunidades.Produtos.Produto

  action_fallback OportunidadesWeb.FallbackController

  def index(conn, _params) do
    produto = Produtos.list_produto()
    render(conn, "produtos.json", produto: produto)
  end

  def pesquisa(conn, %{"pesquisa" => pesquisa_param}) do
    produtos = Produtos.pesquisa(pesquisa_param)
    render(conn, "produtos.json", produto: produtos)
  end

  def create(conn, produto_params) do
    with {:ok, %Produto{} = produto} <- Produtos.create_produto(produto_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.cliente_path(conn, :show, produto))
      |> render("produto.json", produto: produto)
    end
  end

end
