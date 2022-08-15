defmodule Oportunidades.Negocios.Oportunidade do
  use Ecto.Schema
  import Ecto.Changeset
  @primary_key {:id, Ecto.UUID, autogenerate: true}
  alias Oportunidades.Comercial.Cliente
  alias Oportunidades.Etapas.Etapa
  alias Oportunidades.Usuarios.Usuario


  schema "oportunidades" do
    field :data_conclusao, :date
    field :motivoPerda, :string
    field :nome, :string
    field :observacao, :string
    field :previsao_venda, :date
    field :probabilidade, :integer
    field :sequencia, :integer
    field :situacao, :integer
    field :total_anual, :decimal
    field :total_mensal, :decimal
    field :total_unico, :decimal
    belongs_to :etapa, Etapa, type: :binary_id
    belongs_to :cliente, Cliente, type: :binary_id, on_replace: :update
    belongs_to :responsavel, Usuario, type: :binary_id

    timestamps()
  end

  @doc false
  def changeset(oportunidade, attrs) do
    oportunidade
    |> cast(attrs, [:probabilidade, :situacao, :sequencia, :nome, :observacao, :motivoPerda, :total_unico, :total_mensal, :total_anual, :previsao_venda, :data_conclusao, :cliente_id])
    |> validate_required([:nome])
    |> cast_assoc(:etapa)
    |> cast_assoc(:cliente)
    |> cast_assoc(:responsavel)
  end


  def changeset_create(oportunidade, attrs) do
    oportunidade
    |> cast(attrs, [:probabilidade, :situacao, :sequencia, :nome, :observacao, :motivoPerda, :total_unico, :total_mensal, :total_anual, :previsao_venda, :data_conclusao])
    |> validate_required([:nome])
    |> ajustar_cliente(attrs)
    |> ajustar_etapa(attrs)
    |> ajustar_responsavel(attrs)
  end

  def ajustar_cliente(changeset, attrs) do
    #criado para nao inserir novamente um cliente que ja vem com id do front
    if attrs["cliente"]["id"] == nil do
      cast_assoc(changeset, :cliente)
    else
      put_change(changeset, :cliente_id, attrs["cliente"]["id"])
    end
  end

  def ajustar_etapa(changeset, attrs) do
    if attrs["etapa"]["id"] == nil do
      cast_assoc(changeset, :etapa)
    else
      put_change(changeset, :etapa_id, attrs["etapa"]["id"])
    end
  end

  def ajustar_responsavel(changeset, attrs) do
    if attrs["responsavel"]["id"] == nil do
      cast_assoc(changeset, :responsavel)
    else
      put_change(changeset, :responsavel_id, attrs["responsavel"]["id"])
    end
  end


end
