defmodule Oportunidades.UsuariosFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Oportunidades.Usuarios` context.
  """

  @doc """
  Generate a usuario.
  """
  def usuario_fixture(attrs \\ %{}) do
    {:ok, usuario} =
      attrs
      |> Enum.into(%{
        funcao: "some funcao",
        login: "some login",
        nome: "some nome",
        senha: "some senha",
        situacao: true
      })
      |> Oportunidades.Usuarios.create_usuario()

    usuario
  end
end
