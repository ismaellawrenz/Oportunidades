defmodule Oportunidades.Repo.Migrations.CreateCliente do
  use Ecto.Migration

  def change do
    create table(:cliente, primary_key: false) do
      add :id, :uuid, primary_key: true
      add :nome, :string
      add :cnpj, :string
      add :origemDescricao, :string
      add :nomeFantasia, :string
      add :origem, :integer
      add :telefones, {:array, :string}
      add :emails, {:array, :string}

      timestamps()
    end
  end
end
