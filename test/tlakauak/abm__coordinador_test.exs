defmodule Tlakauak.Abm_CoordinadorTest do
  use Tlakauak.DataCase

  alias Tlakauak.Abm_Coordinador

  describe "coordinadores" do
    alias Tlakauak.Abm_Coordinador.Coordinador

    @valid_attrs %{clave: "some clave", descripcion: "some descripcion"}
    @update_attrs %{clave: "some updated clave", descripcion: "some updated descripcion"}
    @invalid_attrs %{clave: nil, descripcion: nil}

    def coordinador_fixture(attrs \\ %{}) do
      {:ok, coordinador} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Abm_Coordinador.create_coordinador()

      coordinador
    end

    test "list_coordinadores/0 returns all coordinadores" do
      coordinador = coordinador_fixture()
      assert Abm_Coordinador.list_coordinadores() == [coordinador]
    end

    test "get_coordinador!/1 returns the coordinador with given id" do
      coordinador = coordinador_fixture()
      assert Abm_Coordinador.get_coordinador!(coordinador.id) == coordinador
    end

    test "create_coordinador/1 with valid data creates a coordinador" do
      assert {:ok, %Coordinador{} = coordinador} = Abm_Coordinador.create_coordinador(@valid_attrs)
      assert coordinador.clave == "some clave"
      assert coordinador.descripcion == "some descripcion"
    end

    test "create_coordinador/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Abm_Coordinador.create_coordinador(@invalid_attrs)
    end

    test "update_coordinador/2 with valid data updates the coordinador" do
      coordinador = coordinador_fixture()
      assert {:ok, %Coordinador{} = coordinador} = Abm_Coordinador.update_coordinador(coordinador, @update_attrs)
      assert coordinador.clave == "some updated clave"
      assert coordinador.descripcion == "some updated descripcion"
    end

    test "update_coordinador/2 with invalid data returns error changeset" do
      coordinador = coordinador_fixture()
      assert {:error, %Ecto.Changeset{}} = Abm_Coordinador.update_coordinador(coordinador, @invalid_attrs)
      assert coordinador == Abm_Coordinador.get_coordinador!(coordinador.id)
    end

    test "delete_coordinador/1 deletes the coordinador" do
      coordinador = coordinador_fixture()
      assert {:ok, %Coordinador{}} = Abm_Coordinador.delete_coordinador(coordinador)
      assert_raise Ecto.NoResultsError, fn -> Abm_Coordinador.get_coordinador!(coordinador.id) end
    end

    test "change_coordinador/1 returns a coordinador changeset" do
      coordinador = coordinador_fixture()
      assert %Ecto.Changeset{} = Abm_Coordinador.change_coordinador(coordinador)
    end
  end
end
