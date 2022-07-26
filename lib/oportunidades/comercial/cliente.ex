defmodule Oportunidades.Comercial.Cliente do
  use Ecto.Schema
  import Ecto.Changeset
  alias Oportunidades.Comercial.Endereco
  alias Oportunidades.Negocios.Oportunidade
  @primary_key {:id, Ecto.UUID, autogenerate: true}

  schema "cliente" do
    field :cnpj, :string
    field :emails, {:array, :string}
    field :nome, :string
    field :nomeFantasia, :string
    field :origem, :integer
    field :origemDescricao, :string
    field :telefones, {:array, :string}
    has_many(:enderecos, Endereco)
    has_many(:oportunidades, Oportunidade)
    timestamps()
  end

  @doc false
  def changeset(cliente, attrs) do
    cliente
    |> cast(attrs, [:nome, :cnpj, :origemDescricao, :nomeFantasia, :origem, :telefones, :emails, :id])
    |> validate_required([:nome])
    |> cast_assoc(:enderecos)
  end
end
