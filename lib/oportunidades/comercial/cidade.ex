defmodule Oportunidades.Comercial.Cidade do
  use Ecto.Schema
  import Ecto.Changeset
  alias Oportunidades.Comercial.Endereco


  schema "cidades" do
    field :ibge, :integer
    field :nome, :string
    field :uf, :string
    has_many :endereco, Endereco
    timestamps()
  end

  @doc false
  def changeset(cliente, attrs) do
    cliente
    |> cast(attrs, [:ibge, :nome, :uf])
    |> validate_required([:nome])
  end
end
