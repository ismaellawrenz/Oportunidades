defmodule OportunidadesWeb.OportunidadeView do
  use OportunidadesWeb, :view
  alias OportunidadesWeb.OportunidadeView

  def render("index.json", %{oportunidades: oportunidades}) do
     render_many(oportunidades, OportunidadeView, "oportunidade.json")
  end

  def render("show.json", %{oportunidade: oportunidade}) do
     render_one(oportunidade, OportunidadeView, "oportunidade.json")
  end

  def render("oportunidade.json", %{oportunidade: oportunidade}) do
    %{
      id: oportunidade.id,
      probabilidade: oportunidade.probabilidade,
      situacao: oportunidade.situacao,
      sequencia: oportunidade.sequencia,
      nome: oportunidade.nome,
      observacao: oportunidade.observacao,
      motivoPerda: oportunidade.motivoPerda,
      total_unico: oportunidade.total_unico,
      total_mensal: oportunidade.total_mensal,
      total_anual: oportunidade.total_anual,
      previsao_venda: oportunidade.previsao_venda,
      data_conclusao: oportunidade.data_conclusao,
      cliente: render_one(oportunidade.cliente, OportunidadeView, "cliente.json", as: :cliente),
      etapa: render_one(oportunidade.etapa, OportunidadeView, "etapa.json", as: :etapa),
      responsavel: render_one(oportunidade.responsavel, OportunidadeView, "responsavel.json", as: :responsavel)
    }
  end


  def render("cliente.json", %{cliente: cliente}) do
    %{
      id: cliente.id,
      nome: cliente.nome
    }
  end

  def render("etapa.json", %{etapa: etapa}) do
    %{
      id: etapa.id,
      descricao: etapa.descricao
    }
  end

  def render("responsavel.json", %{responsavel: responsavel}) do
    %{
      id: responsavel.id,
      nome: responsavel.nome
    }
  end
end
