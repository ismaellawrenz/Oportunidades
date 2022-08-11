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
  def get_oportunidade!(id), do: Repo.get!(Oportunidade, id)

  @doc """
  Creates a oportunidade.
  
  ## Examples
  
      iex> create_oportunidade(%{field: value})
      {:ok, %Oportunidade{}}
  
      iex> create_oportunidade(%{field: bad_value})
      {:error, %Ecto.Changeset{}}
  
  """
  def create_oportunidade(attrs \\ %{}) do
    if attrs["cliente"]["id"] == nil do
      %Oportunidade{}
      |> Oportunidade.changeset_create_cliente(attrs)
      |> Repo.insert()
    else
      cha =
        %Oportunidade{}
        |> Oportunidade.changeset_create(attrs)
        |> put_change(:cliente_id, attrs["cliente"]["id"])

      with {:ok, %Oportunidade{} = oportunidade} <- Repo.insert(cha) do
        IO.inspect(oportunidade)
        Map.put(oportunidade, :cliente, %{id: 123})
        {:ok, oportunidade}
      end

      # Map.put(cha.cliente, :cliente, %{id: 123})
      # |> IO.inspect()
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
    oportunidade
    |> Oportunidade.changeset(attrs)
    |> Repo.update()
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
