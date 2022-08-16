defmodule Oportunidades.Usuarios.Usuario do
  use Ecto.Schema
  import Ecto.Changeset
  @primary_key {:id, Ecto.UUID, autogenerate: true}
  alias Oportunidades.Negocios.Oportunidade

  schema "usuario" do
    field :funcao, :string
    field :login, :string
    field :nome, :string
    field :senha, :string
    field :situacao, :boolean, default: false
    has_many(:oportunidade, Oportunidade, foreign_key: :responsavel_id)
    timestamps()
  end

  def changeset(usuario, attrs) do
    usuario
    |> cast(attrs, [:nome, :senha, :login, :funcao, :situacao, :id])
    |> validate_required([:nome])
  end

  def changeset_create(usuario, attrs) do
    usuario
    |> cast(attrs, [:nome, :senha, :login, :funcao, :situacao])
    |> validate_required([:nome])
    |> put_pass_hash()
  end

  defp put_pass_hash(%Ecto.Changeset{valid?: true, changes: %{senha: senha}} = changeset) do
    change(changeset, %{senha: Pbkdf2.add_hash(senha).password_hash})
  end
end
