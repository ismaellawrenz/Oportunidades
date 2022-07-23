defmodule Oportunidades.Cliente do
  @moduledoc """
  The Comercial context.
  """

  import Ecto.Query, warn: false
  alias Oportunidades.Repo

  alias Oportunidades.Comercial.Cliente

  @doc """
  Returns the list of cliente.

  ## Examples

      iex> list_cliente()
      [%Cliente{}, ...]

  """
  def list_cliente do
    Repo.all(Cliente)
  end

  def pesquisa (pesquisa) do
    Repo.all(from(a in Cliente, where: like(a.nome, ^"#{pesquisa}%") or like(a.cnpj, ^"#{pesquisa}%")))
    |> Repo.preload([:enderecos, enderecos: [:cidade]])
  end

  @doc """
  Gets a single cliente.

  Raises `Ecto.NoResultsError` if the Cliente does not exist.

  ## Examples

      iex> get_cliente!(123)
      %Cliente{}

      iex> get_cliente!(456)
      ** (Ecto.NoResultsError)

  """
  def get_cliente!(id), do: Repo.get!(Cliente, id) |> Repo.preload([:enderecos, enderecos: [:cidade]])

  @doc """
  Creates a cliente.

  ## Examples

      iex> create_cliente(%{field: value})
      {:ok, %Cliente{}}

      iex> create_cliente(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_cliente(attrs \\ %{}) do
    %Cliente{}
    |> Cliente.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a cliente.

  ## Examples

      iex> update_cliente(cliente, %{field: new_value})
      {:ok, %Cliente{}}

      iex> update_cliente(cliente, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_cliente(%Cliente{} = cliente, attrs) do
    cliente
    |> Cliente.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a cliente.

  ## Examples

      iex> delete_cliente(cliente)
      {:ok, %Cliente{}}

      iex> delete_cliente(cliente)
      {:error, %Ecto.Changeset{}}

  """
  def delete_cliente(%Cliente{} = cliente) do
    Repo.delete(cliente)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking cliente changes.

  ## Examples

      iex> change_cliente(cliente)
      %Ecto.Changeset{data: %Cliente{}}

  """
  def change_cliente(%Cliente{} = cliente, attrs \\ %{}) do
    Cliente.changeset(cliente, attrs)
  end
end
