defmodule Oportunidades.UsuariosTest do
  use Oportunidades.DataCase

  alias Oportunidades.Usuarios

  describe "usuario" do
    alias Oportunidades.Usuarios.Usuario

    import Oportunidades.UsuariosFixtures

    @invalid_attrs %{funcao: nil, login: nil, nome: nil, senha: nil, situacao: nil}

    test "list_usuario/0 returns all usuario" do
      usuario = usuario_fixture()
      assert Usuarios.list_usuario() == [usuario]
    end

    test "get_usuario!/1 returns the usuario with given id" do
      usuario = usuario_fixture()
      assert Usuarios.get_usuario!(usuario.id) == usuario
    end

    test "create_usuario/1 with valid data creates a usuario" do
      valid_attrs = %{funcao: "some funcao", login: "some login", nome: "some nome", senha: "some senha", situacao: true}

      assert {:ok, %Usuario{} = usuario} = Usuarios.create_usuario(valid_attrs)
      assert usuario.funcao == "some funcao"
      assert usuario.login == "some login"
      assert usuario.nome == "some nome"
      assert usuario.senha == "some senha"
      assert usuario.situacao == true
    end

    test "create_usuario/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Usuarios.create_usuario(@invalid_attrs)
    end

    test "update_usuario/2 with valid data updates the usuario" do
      usuario = usuario_fixture()
      update_attrs = %{funcao: "some updated funcao", login: "some updated login", nome: "some updated nome", senha: "some updated senha", situacao: false}

      assert {:ok, %Usuario{} = usuario} = Usuarios.update_usuario(usuario, update_attrs)
      assert usuario.funcao == "some updated funcao"
      assert usuario.login == "some updated login"
      assert usuario.nome == "some updated nome"
      assert usuario.senha == "some updated senha"
      assert usuario.situacao == false
    end

    test "update_usuario/2 with invalid data returns error changeset" do
      usuario = usuario_fixture()
      assert {:error, %Ecto.Changeset{}} = Usuarios.update_usuario(usuario, @invalid_attrs)
      assert usuario == Usuarios.get_usuario!(usuario.id)
    end

    test "delete_usuario/1 deletes the usuario" do
      usuario = usuario_fixture()
      assert {:ok, %Usuario{}} = Usuarios.delete_usuario(usuario)
      assert_raise Ecto.NoResultsError, fn -> Usuarios.get_usuario!(usuario.id) end
    end

    test "change_usuario/1 returns a usuario changeset" do
      usuario = usuario_fixture()
      assert %Ecto.Changeset{} = Usuarios.change_usuario(usuario)
    end
  end
end
