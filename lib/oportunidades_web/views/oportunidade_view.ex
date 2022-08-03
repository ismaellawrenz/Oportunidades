defmodule OportunidadesWeb.OportunidadeView do
  use OportunidadesWeb, :view
  alias OportunidadesWeb.OportunidadeView

  def render("index.json", %{oportunidades: oportunidades}) do
    %{data: render_many(oportunidades, OportunidadeView, "oportunidade.json")}
  end

  def render("show.json", %{oportunidade: oportunidade}) do
    %{data: render_one(oportunidade, OportunidadeView, "oportunidade.json")}
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
      data_conclusao: oportunidade.data_conclusao
    }
  end
end
