defmodule Oportunidades.Usuarios do
  @moduledoc """
  The Usuarios context.
  """

  import Ecto.Query, warn: false
  alias Oportunidades.Repo

  alias Oportunidades.Usuarios.Usuario

  @doc """
  Returns the list of usuario.

  ## Examples

      iex> list_usuario()
      [%Usuario{}, ...]

  """
  def list_usuario do
    Repo.all(Usuario)
  end

  @doc """
  Gets a single usuario.

  Raises `Ecto.NoResultsError` if the Usuario does not exist.

  ## Examples

      iex> get_usuario!(123)
      %Usuario{}

      iex> get_usuario!(456)
      ** (Ecto.NoResultsError)

  """
  def get_usuario!(id), do: Repo.get!(Usuario, id)

  @doc """
  Creates a usuario.

  ## Examples

      iex> create_usuario(%{field: value})
      {:ok, %Usuario{}}

      iex> create_usuario(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_usuario(params) do
    %Usuario{}
    |> Usuario.changeset_create(params)
    |> Repo.insert()
  end

  @doc """
  Updates a usuario.

  ## Examples

      iex> update_usuario(usuario, %{field: new_value})
      {:ok, %Usuario{}}

      iex> update_usuario(usuario, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_usuario(%Usuario{} = usuario, attrs) do
    usuario
    |> Usuario.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a usuario.

  ## Examples

      iex> delete_usuario(usuario)
      {:ok, %Usuario{}}

      iex> delete_usuario(usuario)
      {:error, %Ecto.Changeset{}}

  """
  def delete_usuario(%Usuario{} = usuario) do
    Repo.delete(usuario)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking usuario changes.

  ## Examples

      iex> change_usuario(usuario)
      %Ecto.Changeset{data: %Usuario{}}

  """
  def change_usuario(%Usuario{} = usuario, attrs \\ %{}) do
    Usuario.changeset(usuario, attrs)
  end
end
