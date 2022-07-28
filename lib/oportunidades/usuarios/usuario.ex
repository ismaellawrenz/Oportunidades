defmodule Oportunidades.Usuarios.Usuario do
  use Ecto.Schema
  import Ecto.Changeset
  @primary_key {:id, Ecto.UUID, autogenerate: true}

  schema "usuario" do
    field :funcao, :string
    field :login, :string
    field :nome, :string
    field :senha, :string
    field :situacao, :boolean, default: false

    timestamps()
  end

  def changeset(usuario, attrs) do
    usuario
    |> cast(attrs, [:nome, :senha, :login, :funcao, :situacao])
    |> validate_required([:nome])
  end

  def changeset_create(usuario, attrs) do
    usuario
    |> cast(attrs, [:nome, :senha, :login, :funcao, :situacao])
    |> validate_required([:nome])
    |> put_pass_hash()
  end

  defp put_pass_hash(%Ecto.Changeset{valid?: true, changes: %{senha: senha}} = changeset) do
    change(changeset, Pbkdf2.add_hash(senha))
  end
end