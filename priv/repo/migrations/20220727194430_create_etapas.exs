defmodule Oportunidades.Repo.Migrations.CreateEtapas do
  use Ecto.Migration

  def change do
    create table(:etapas, primary_key: false) do
      add :id, :uuid, primary_key: true
      add :sequencia, :integer
      add :descricao, :string

      timestamps()
    end
  end
end
