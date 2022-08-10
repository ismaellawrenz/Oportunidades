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

  def changeset_create_cliente(oportunidade, attrs) do
    oportunidade
    |> cast(attrs, [:probabilidade, :situacao, :sequencia, :nome, :observacao, :motivoPerda, :total_unico, :total_mensal, :total_anual, :previsao_venda, :data_conclusao])
    |> validate_required([:nome])
    |> cast_assoc(:etapa)
    |> cast_assoc(:cliente)
    |> cast_assoc(:responsavel)

  end
  def changeset_create(oportunidade, attrs) do
    oportunidade
    |> cast(attrs, [:probabilidade, :situacao, :sequencia, :nome, :observacao, :motivoPerda, :total_unico, :total_mensal, :total_anual, :previsao_venda, :data_conclusao, :cliente_id])
    |> validate_required([:nome])
    |> cast_assoc(:etapa)
    |> cast_assoc(:responsavel)

  end



  def ajustar_cliente(changeset) do
    name = get_field(changeset, :cliente)


    if name.id == nil do
      put_change(changeset, :cliente, nil)
    else
      changeset
    end
  end

end
