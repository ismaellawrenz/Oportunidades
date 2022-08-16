defmodule Oportunidades.Negocios do
  @moduledoc """
  The Negocios context.
  """

  import Ecto.Query, warn: false
  alias Oportunidades.Repo
  import Ecto.Changeset

  alias Oportunidades.Negocios.Oportunidade

  @doc """
  Returns the list of oportunidades.

  ## Examples

      iex> list_oportunidades()
      [%Oportunidade{}, ...]

  """
  def list_oportunidades do
    Repo.all(Oportunidade)
  end

  @doc """
  Gets a single oportunidade.

  Raises `Ecto.NoResultsError` if the Oportunidade does not exist.

  ## Examples

      iex> get_oportunidade!(123)
      %Oportunidade{}

      iex> get_oportunidade!(456)
      ** (Ecto.NoResultsError)

  """

  def get_oportunidade!(id), do: Repo.get!(Oportunidade, id) |> Repo.preload([:cliente, :etapa, :responsavel])

  @doc """
  Creates a oportunidade.

  ## Examples

      iex> create_oportunidade(%{field: value})
      {:ok, %Oportunidade{}}

      iex> create_oportunidade(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_oportunidade(attrs \\ %{}) do
      changeset =
        %Oportunidade{}
        |> Oportunidade.changeset_create(attrs)
      with {:ok, %Oportunidade{} = oportunidade} <- Repo.insert(changeset) do
        oportunidade = Map.put(oportunidade, :cliente, %{id: oportunidade.cliente_id, nome: attrs["cliente"]["nome"]})
        oportunidade = Map.put(oportunidade, :etapa, %{id: oportunidade.etapa_id, descricao: attrs["etapa"]["descricao"]})
        oportunidade = Map.put(oportunidade, :responsavel, %{id: oportunidade.responsavel_id, nome: attrs["responsavel"]["nome"]})
        {:ok, oportunidade}
      end

  end

  @doc """
  Updates a oportunidade.

  ## Examples

      iex> update_oportunidade(oportunidade, %{field: new_value})
      {:ok, %Oportunidade{}}

      iex> update_oportunidade(oportunidade, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_oportunidade(%Oportunidade{} = oportunidade, attrs) do
    changeset =
      %Oportunidade{}
      |> Oportunidade.changeset(attrs)

      IO.inspect(changeset)

      Repo.update(changeset)

    #with {:ok, %Oportunidade{} = oportunidade} <- Repo.update(changeset) do
     # oportunidade = Map.put(oportunidade, :cliente, %{id: oportunidade.cliente_id, nome: attrs["cliente"]["nome"]})
      #oportunidade = Map.put(oportunidade, :etapa, %{id: oportunidade.etapa_id, descricao: attrs["etapa"]["descricao"]})
     # oportunidade = Map.put(oportunidade, :responsavel, %{id: oportunidade.responsavel_id, nome: attrs["responsavel"]["nome"]})
     # {:ok, oportunidade}
    #end

  end

  @doc """
  Deletes a oportunidade.

  ## Examples

      iex> delete_oportunidade(oportunidade)
      {:ok, %Oportunidade{}}

      iex> delete_oportunidade(oportunidade)
      {:error, %Ecto.Changeset{}}

  """
  def delete_oportunidade(%Oportunidade{} = oportunidade) do
    Repo.delete(oportunidade)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking oportunidade changes.

  ## Examples

      iex> change_oportunidade(oportunidade)
      %Ecto.Changeset{data: %Oportunidade{}}

  """
  def change_oportunidade(%Oportunidade{} = oportunidade, attrs \\ %{}) do
    Oportunidade.changeset(oportunidade, attrs)
  end
end
