defmodule Oportunidades.Etapas do
  @moduledoc """
  The Etapas context.
  """

  import Ecto.Query, warn: false
  alias Oportunidades.Repo

  alias Oportunidades.Etapas.Etapa

  @doc """
  Returns the list of etapas.

  ## Examples

      iex> list_etapas()
      [%Etapa{}, ...]

  """
  def list_etapas do
    Repo.all(from e in Etapa, order_by: e.sequencia)
  end

  @doc """
  Gets a single etapa.

  Raises `Ecto.NoResultsError` if the Etapa does not exist.

  ## Examples

      iex> get_etapa!(123)
      %Etapa{}

      iex> get_etapa!(456)
      ** (Ecto.NoResultsError)

  """
  def get_etapa!(id), do: Repo.get!(Etapa, id)

  @doc """
  Creates a etapa.

  ## Examples

      iex> create_etapa(%{field: value})
      {:ok, %Etapa{}}

      iex> create_etapa(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_etapa(attrs \\ %{}) do
    %Etapa{}
    |> Etapa.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a etapa.

  ## Examples

      iex> update_etapa(etapa, %{field: new_value})
      {:ok, %Etapa{}}

      iex> update_etapa(etapa, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_etapa(%Etapa{} = etapa, attrs) do
    etapa
    |> Etapa.changeset(attrs)
    |> Repo.update()
  end


  def alterar_sequencia(etapa_params) do
    etapa = get_etapa!(etapa_params["id"])
    if etapa.sequencia > etapa_params["sequencia"] do
      update_sequencia_maior(etapa_params["sequencia"], etapa.sequencia)
    else
      update_sequencia_menor(etapa_params["sequencia"], etapa.sequencia)
    end
    update_etapa(etapa, etapa_params)
  end

  defp update_sequencia_maior(sequenciaNova, sequenciaAntiga) do
    #Etapa
    #|> where: sequencia >1
    #|> Repo.update_all(inc: [sequencia: 1])
    Repo.update_all(from(p in Etapa, where: p.sequencia > ^sequenciaNova and p.sequencia < ^sequenciaAntiga), [inc: [sequencia: 1]])
  end

  defp update_sequencia_menor(sequenciaNova, sequenciaAntiga) do
    #Etapa
    #|> where: sequencia >1
    #|> Repo.update_all(inc: [sequencia: 1])
    Repo.update_all(from(p in Etapa, where: p.sequencia < ^sequenciaNova and p.sequencia > ^sequenciaAntiga), [inc: [sequencia: -1]])
  end

  @doc """
  Deletes a etapa.

  ## Examples

      iex> delete_etapa(etapa)
      {:ok, %Etapa{}}

      iex> delete_etapa(etapa)
      {:error, %Ecto.Changeset{}}

  """
  def delete_etapa(%Etapa{} = etapa) do
    Repo.delete(etapa)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking etapa changes.

  ## Examples

      iex> change_etapa(etapa)
      %Ecto.Changeset{data: %Etapa{}}

  """
  def change_etapa(%Etapa{} = etapa, attrs \\ %{}) do
    Etapa.changeset(etapa, attrs)
  end
end
