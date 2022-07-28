defmodule Oportunidades.Repo.Migrations.CreateUsuario do
  use Ecto.Migration

  def change do
    create table(:usuario, primary_key: false) do
      add :id, :uuid, primary_key: true
      add :nome, :string
      add :senha, :string
      add :login, :string
      add :funcao, :string
      add :situacao, :boolean, default: false, null: false

      timestamps()
    end
  end
end
