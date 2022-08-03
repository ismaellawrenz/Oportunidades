defmodule Oportunidades.Etapas.Etapa do
  use Ecto.Schema
  import Ecto.Changeset
  @primary_key {:id, Ecto.UUID, autogenerate: true}
  alias Oportunidades.Negocios.Oportunidade
  schema "etapas" do
    field :descricao, :string
    field :sequencia, :integer
    has_many(:oportunidade, Oportunidade)
    timestamps()
  end

  @doc false
  def changeset(etapa, attrs) do
    etapa
    |> cast(attrs, [:sequencia, :descricao])
    |> validate_required([:sequencia, :descricao])
  end
end
