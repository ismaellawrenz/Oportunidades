defmodule Oportunidades.Comercial.Endereco do
  use Ecto.Schema
  import Ecto.Changeset
  alias Oportunidades.Comercial.Cidade
  alias Oportunidades.Comercial.Cliente


  schema "enderecos" do
    field :cep, :string
    field :numero, :string
    field :logradouro, :string
    field :bairro, :string
    field :complemento, :string
    field :situacao, :boolean
    belongs_to :cliente, Cliente, type: :binary_id
    belongs_to :cidade, Cidade
    timestamps()
  end

  @doc false
  def changeset(cliente, attrs) do
    cliente
    |> cast(attrs, [:cep, :numero, :logradouro, :bairro, :complemento, :situacao])
    |> cast_assoc(:cidade)
  end
end
