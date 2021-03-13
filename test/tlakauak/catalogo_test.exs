defmodule Tlakauak.CatalogoTest do
  use Tlakauak.DataCase

  alias Tlakauak.Catalogo

  describe "promotores" do
    alias Tlakauak.Catalogo.Promotor

    @valid_attrs %{clave: "some clave", descripcion: "some descripcion"}
    @update_attrs %{clave: "some updated clave", descripcion: "some updated descripcion"}
    @invalid_attrs %{clave: nil, descripcion: nil}

    def promotor_fixture(attrs \\ %{}) do
      {:ok, promotor} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Catalogo.create_promotor()

      promotor
    end

    test "list_promotores/0 returns all promotores" do
      promotor = promotor_fixture()
      assert Catalogo.list_promotores() == [promotor]
    end

    test "get_promotor!/1 returns the promotor with given id" do
      promotor = promotor_fixture()
      assert Catalogo.get_promotor!(promotor.id) == promotor
    end

    test "create_promotor/1 with valid data creates a promotor" do
      assert {:ok, %Promotor{} = promotor} = Catalogo.create_promotor(@valid_attrs)
      assert promotor.clave == "some clave"
      assert promotor.descripcion == "some descripcion"
    end

    test "create_promotor/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Catalogo.create_promotor(@invalid_attrs)
    end

    test "update_promotor/2 with valid data updates the promotor" do
      promotor = promotor_fixture()
      assert {:ok, %Promotor{} = promotor} = Catalogo.update_promotor(promotor, @update_attrs)
      assert promotor.clave == "some updated clave"
      assert promotor.descripcion == "some updated descripcion"
    end

    test "update_promotor/2 with invalid data returns error changeset" do
      promotor = promotor_fixture()
      assert {:error, %Ecto.Changeset{}} = Catalogo.update_promotor(promotor, @invalid_attrs)
      assert promotor == Catalogo.get_promotor!(promotor.id)
    end

    test "delete_promotor/1 deletes the promotor" do
      promotor = promotor_fixture()
      assert {:ok, %Promotor{}} = Catalogo.delete_promotor(promotor)
      assert_raise Ecto.NoResultsError, fn -> Catalogo.get_promotor!(promotor.id) end
    end

    test "change_promotor/1 returns a promotor changeset" do
      promotor = promotor_fixture()
      assert %Ecto.Changeset{} = Catalogo.change_promotor(promotor)
    end
  end
end
