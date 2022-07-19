defmodule Oportunidades.Comercial.Cliente do
  use Ecto.Schema
  import Ecto.Changeset
  @primary_key {:id, Ecto.UUID, autogenerate: true}

  schema "cliente" do
    field :cnpj, :string
    field :emails, {:array, :string}
    field :nome, :string
    field :nomeFantasia, :string
    field :origem, :integer
    field :origemDescricao, :string
    field :telefones, {:array, :string}

    timestamps()
  end

  @doc false
  def changeset(cliente, attrs) do
    cliente
    |> cast(attrs, [:nome, :cnpj, :origemDescricao, :nomeFantasia, :origem, :telefones, :emails])
    |> validate_required([:nome])
  end
end
