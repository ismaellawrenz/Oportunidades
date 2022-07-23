defmodule Oportunidades.Produtos.Produto do
  use Ecto.Schema
  import Ecto.Changeset
  @primary_key {:id, Ecto.UUID, autogenerate: true}

  schema "produto" do
    field :nome, :string
    field :tipo, :integer
    field :valor, :decimal

    timestamps()
  end

  @doc false
  def changeset(produto, attrs) do
    produto
    |> cast(attrs, [:nome, :valor, :tipo])
    |> validate_required([:nome])
  end
end
