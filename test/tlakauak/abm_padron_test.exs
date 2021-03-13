defmodule Tlakauak.AbmPadronTest do
  use Tlakauak.DataCase

  alias Tlakauak.AbmPadron

  describe "promovidos" do
    alias Tlakauak.AbmPadron.Promovido

    @valid_attrs %{clave: "some clave", colonia_id: 42, coordinador_id: 42, descripcion: "some descripcion", direccion: "some direccion", inactivo: true, localidad_id: 42, promotor_id: 42, seccional: "some seccional", telefono: "some telefono"}
    @update_attrs %{clave: "some updated clave", colonia_id: 43, coordinador_id: 43, descripcion: "some updated descripcion", direccion: "some updated direccion", inactivo: false, localidad_id: 43, promotor_id: 43, seccional: "some updated seccional", telefono: "some updated telefono"}
    @invalid_attrs %{clave: nil, colonia_id: nil, coordinador_id: nil, descripcion: nil, direccion: nil, inactivo: nil, localidad_id: nil, promotor_id: nil, seccional: nil, telefono: nil}

    def promovido_fixture(attrs \\ %{}) do
      {:ok, promovido} =
        attrs
        |> Enum.into(@valid_attrs)
        |> AbmPadron.create_promovido()

      promovido
    end

    test "list_promovidos/0 returns all promovidos" do
      promovido = promovido_fixture()
      assert AbmPadron.list_promovidos() == [promovido]
    end

    test "get_promovido!/1 returns the promovido with given id" do
      promovido = promovido_fixture()
      assert AbmPadron.get_promovido!(promovido.id) == promovido
    end

    test "create_promovido/1 with valid data creates a promovido" do
      assert {:ok, %Promovido{} = promovido} = AbmPadron.create_promovido(@valid_attrs)
      assert promovido.clave == "some clave"
      assert promovido.colonia_id == 42
      assert promovido.coordinador_id == 42
      assert promovido.descripcion == "some descripcion"
      assert promovido.direccion == "some direccion"
      assert promovido.inactivo == true
      assert promovido.localidad_id == 42
      assert promovido.promotor_id == 42
      assert promovido.seccional == "some seccional"
      assert promovido.telefono == "some telefono"
    end

    test "create_promovido/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = AbmPadron.create_promovido(@invalid_attrs)
    end

    test "update_promovido/2 with valid data updates the promovido" do
      promovido = promovido_fixture()
      assert {:ok, %Promovido{} = promovido} = AbmPadron.update_promovido(promovido, @update_attrs)
      assert promovido.clave == "some updated clave"
      assert promovido.colonia_id == 43
      assert promovido.coordinador_id == 43
      assert promovido.descripcion == "some updated descripcion"
      assert promovido.direccion == "some updated direccion"
      assert promovido.inactivo == false
      assert promovido.localidad_id == 43
      assert promovido.promotor_id == 43
      assert promovido.seccional == "some updated seccional"
      assert promovido.telefono == "some updated telefono"
    end

    test "update_promovido/2 with invalid data returns error changeset" do
      promovido = promovido_fixture()
      assert {:error, %Ecto.Changeset{}} = AbmPadron.update_promovido(promovido, @invalid_attrs)
      assert promovido == AbmPadron.get_promovido!(promovido.id)
    end

    test "delete_promovido/1 deletes the promovido" do
      promovido = promovido_fixture()
      assert {:ok, %Promovido{}} = AbmPadron.delete_promovido(promovido)
      assert_raise Ecto.NoResultsError, fn -> AbmPadron.get_promovido!(promovido.id) end
    end

    test "change_promovido/1 returns a promovido changeset" do
      promovido = promovido_fixture()
      assert %Ecto.Changeset{} = AbmPadron.change_promovido(promovido)
    end
  end
end
