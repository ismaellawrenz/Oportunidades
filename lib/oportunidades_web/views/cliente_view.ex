defmodule OportunidadesWeb.ClienteView do
  use OportunidadesWeb, :view
  alias OportunidadesWeb.ClienteView

  def render("clientes.json", %{cliente: cliente}) do
     render_many(cliente, ClienteView, "cliente.json")
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
      emails: cliente.emails,
      enderecos: render_many(cliente.enderecos, ClienteView, "endereco.json", as: :endereco)
    }
  end

  def render("endereco.json", %{endereco: endereco})do
    %{
      id: endereco.id,
      cep: endereco.cep,
      numero: endereco.numero,
      logradouro: endereco.logradouro,
      bairro: endereco.bairro,
      complemento: endereco.complemento,
      situacao: endereco.situacao,
      cidade: %{
        id: endereco.cidade.id,
        ibge: endereco.cidade.ibge,
        uf: endereco.cidade.uf,
        nome: endereco.cidade.nome
      }
    }
  end
end
