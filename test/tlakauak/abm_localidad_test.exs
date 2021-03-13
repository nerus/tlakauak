defmodule Tlakauak.AbmLocalidadTest do
  use Tlakauak.DataCase

  alias Tlakauak.AbmLocalidad

  describe "localidades" do
    alias Tlakauak.AbmLocalidad.Localidad

    @valid_attrs %{clave: "some clave", descripcion: "some descripcion", inactivo: true}
    @update_attrs %{clave: "some updated clave", descripcion: "some updated descripcion", inactivo: false}
    @invalid_attrs %{clave: nil, descripcion: nil, inactivo: nil}

    def localidad_fixture(attrs \\ %{}) do
      {:ok, localidad} =
        attrs
        |> Enum.into(@valid_attrs)
        |> AbmLocalidad.create_localidad()

      localidad
    end

    test "list_localidades/0 returns all localidades" do
      localidad = localidad_fixture()
      assert AbmLocalidad.list_localidades() == [localidad]
    end

    test "get_localidad!/1 returns the localidad with given id" do
      localidad = localidad_fixture()
      assert AbmLocalidad.get_localidad!(localidad.id) == localidad
    end

    test "create_localidad/1 with valid data creates a localidad" do
      assert {:ok, %Localidad{} = localidad} = AbmLocalidad.create_localidad(@valid_attrs)
      assert localidad.clave == "some clave"
      assert localidad.descripcion == "some descripcion"
      assert localidad.inactivo == true
    end

    test "create_localidad/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = AbmLocalidad.create_localidad(@invalid_attrs)
    end

    test "update_localidad/2 with valid data updates the localidad" do
      localidad = localidad_fixture()
      assert {:ok, %Localidad{} = localidad} = AbmLocalidad.update_localidad(localidad, @update_attrs)
      assert localidad.clave == "some updated clave"
      assert localidad.descripcion == "some updated descripcion"
      assert localidad.inactivo == false
    end

    test "update_localidad/2 with invalid data returns error changeset" do
      localidad = localidad_fixture()
      assert {:error, %Ecto.Changeset{}} = AbmLocalidad.update_localidad(localidad, @invalid_attrs)
      assert localidad == AbmLocalidad.get_localidad!(localidad.id)
    end

    test "delete_localidad/1 deletes the localidad" do
      localidad = localidad_fixture()
      assert {:ok, %Localidad{}} = AbmLocalidad.delete_localidad(localidad)
      assert_raise Ecto.NoResultsError, fn -> AbmLocalidad.get_localidad!(localidad.id) end
    end

    test "change_localidad/1 returns a localidad changeset" do
      localidad = localidad_fixture()
      assert %Ecto.Changeset{} = AbmLocalidad.change_localidad(localidad)
    end
  end
end
