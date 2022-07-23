defmodule Oportunidades.Repo.Migrations.CreateProduto do
  use Ecto.Migration

  def change do
    create table(:produto, primary_key: false) do
      add :id, :uuid, primary_key: true
      add :nome, :string
      add :valor, :decimal
      add :tipo, :integer

      timestamps()
    end
  end
end
