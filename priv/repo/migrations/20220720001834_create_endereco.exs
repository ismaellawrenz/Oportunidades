defmodule Oportunidades.Repo.Migrations.CreateEndereco do
  use Ecto.Migration

  def change do
    create table(:cidades) do
      add :ibge, :integer
      add :nome, :string
      add :uf, :string
      timestamps()
  end
    create table(:enderecos) do
      add :cep, :string
      add :numero, :string
      add :logradouro, :string
      add :bairro, :string
      add :complemento, :string
      add :situacao, :boolean
      add :cidade_id, references(:cidades, on_delete: :delete_all), null: false
      add :cliente_id, references(:cliente, on_delete: :delete_all, type: :uuid), null: false
      timestamps()
  end

  end
end
