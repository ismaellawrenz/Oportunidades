defmodule OportunidadesWeb.EtapaView do
  use OportunidadesWeb, :view
  alias OportunidadesWeb.EtapaView

  def render("index.json", %{etapas: etapas}) do
     render_many(etapas, EtapaView, "etapa.json")
  end

  def render("show.json", %{etapa: etapa}) do
     render_one(etapa, EtapaView, "etapa.json")
  end

  def render("etapa.json", %{etapa: etapa}) do
    %{
      id: etapa.id,
      sequencia: etapa.sequencia,
      descricao: etapa.descricao
    }
  end
end
