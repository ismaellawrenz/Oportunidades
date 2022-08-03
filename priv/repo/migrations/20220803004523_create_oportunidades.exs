defmodule Oportunidades.Repo.Migrations.CreateOportunidades do
  use Ecto.Migration

  def change do
    create table(:oportunidades, primary_key: false) do
      add :id, :uuid, primary_key: true
      add :probabilidade, :integer
      add :situacao, :integer
      add :sequencia, :integer
      add :nome, :string
      add :observacao, :string
      add :motivoPerda, :string
      add :total_unico, :decimal
      add :total_mensal, :decimal
      add :total_anual, :decimal
      add :previsao_venda, :date
      add :data_conclusao, :date
      add :etapa_id, references(:etapas, on_delete: :nothing, type: :uuid)
      add :cliente_id, references(:cliente, on_delete: :nothing, type: :uuid)
      add :responsavel_id, references(:usuario, on_delete: :nothing, type: :uuid)

      timestamps()
    end

    create index(:oportunidades, [:etapa_id])
    create index(:oportunidades, [:cliente_id])
    create index(:oportunidades, [:responsavel_id])
  end
end
