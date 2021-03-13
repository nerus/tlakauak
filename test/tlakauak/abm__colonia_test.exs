defmodule Tlakauak.Abm_ColoniaTest do
  use Tlakauak.DataCase

  alias Tlakauak.Abm_Colonia

  describe "colonias" do
    alias Tlakauak.Abm_Colonia.Colonia

    @valid_attrs %{clave: "some clave", descripcion: "some descripcion", inactivo: true}
    @update_attrs %{clave: "some updated clave", descripcion: "some updated descripcion", inactivo: false}
    @invalid_attrs %{clave: nil, descripcion: nil, inactivo: nil}

    def colonia_fixture(attrs \\ %{}) do
      {:ok, colonia} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Abm_Colonia.create_colonia()

      colonia
    end

    test "list_colonias/0 returns all colonias" do
      colonia = colonia_fixture()
      assert Abm_Colonia.list_colonias() == [colonia]
    end

    test "get_colonia!/1 returns the colonia with given id" do
      colonia = colonia_fixture()
      assert Abm_Colonia.get_colonia!(colonia.id) == colonia
    end

    test "create_colonia/1 with valid data creates a colonia" do
      assert {:ok, %Colonia{} = colonia} = Abm_Colonia.create_colonia(@valid_attrs)
      assert colonia.clave == "some clave"
      assert colonia.descripcion == "some descripcion"
      assert colonia.inactivo == true
    end

    test "create_colonia/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Abm_Colonia.create_colonia(@invalid_attrs)
    end

    test "update_colonia/2 with valid data updates the colonia" do
      colonia = colonia_fixture()
      assert {:ok, %Colonia{} = colonia} = Abm_Colonia.update_colonia(colonia, @update_attrs)
      assert colonia.clave == "some updated clave"
      assert colonia.descripcion == "some updated descripcion"
      assert colonia.inactivo == false
    end

    test "update_colonia/2 with invalid data returns error changeset" do
      colonia = colonia_fixture()
      assert {:error, %Ecto.Changeset{}} = Abm_Colonia.update_colonia(colonia, @invalid_attrs)
      assert colonia == Abm_Colonia.get_colonia!(colonia.id)
    end

    test "delete_colonia/1 deletes the colonia" do
      colonia = colonia_fixture()
      assert {:ok, %Colonia{}} = Abm_Colonia.delete_colonia(colonia)
      assert_raise Ecto.NoResultsError, fn -> Abm_Colonia.get_colonia!(colonia.id) end
    end

    test "change_colonia/1 returns a colonia changeset" do
      colonia = colonia_fixture()
      assert %Ecto.Changeset{} = Abm_Colonia.change_colonia(colonia)
    end
  end
end
