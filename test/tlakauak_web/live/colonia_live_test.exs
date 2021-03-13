defmodule TlakauakWeb.ColoniaLiveTest do
  use TlakauakWeb.ConnCase

  import Phoenix.LiveViewTest

  alias Tlakauak.Abm_Colonia

  @create_attrs %{clave: "some clave", descripcion: "some descripcion", inactivo: true}
  @update_attrs %{clave: "some updated clave", descripcion: "some updated descripcion", inactivo: false}
  @invalid_attrs %{clave: nil, descripcion: nil, inactivo: nil}

  defp fixture(:colonia) do
    {:ok, colonia} = Abm_Colonia.create_colonia(@create_attrs)
    colonia
  end

  defp create_colonia(_) do
    colonia = fixture(:colonia)
    %{colonia: colonia}
  end

  describe "Index" do
    setup [:create_colonia]

    test "lists all colonias", %{conn: conn, colonia: colonia} do
      {:ok, _index_live, html} = live(conn, Routes.colonia_index_path(conn, :index))

      assert html =~ "Listing Colonias"
      assert html =~ colonia.clave
    end

    test "saves new colonia", %{conn: conn} do
      {:ok, index_live, _html} = live(conn, Routes.colonia_index_path(conn, :index))

      assert index_live |> element("a", "New Colonia") |> render_click() =~
               "New Colonia"

      assert_patch(index_live, Routes.colonia_index_path(conn, :new))

      assert index_live
             |> form("#colonia-form", colonia: @invalid_attrs)
             |> render_change() =~ "can&apos;t be blank"

      {:ok, _, html} =
        index_live
        |> form("#colonia-form", colonia: @create_attrs)
        |> render_submit()
        |> follow_redirect(conn, Routes.colonia_index_path(conn, :index))

      assert html =~ "Colonia created successfully"
      assert html =~ "some clave"
    end

    test "updates colonia in listing", %{conn: conn, colonia: colonia} do
      {:ok, index_live, _html} = live(conn, Routes.colonia_index_path(conn, :index))

      assert index_live |> element("#colonia-#{colonia.id} a", "Edit") |> render_click() =~
               "Edit Colonia"

      assert_patch(index_live, Routes.colonia_index_path(conn, :edit, colonia))

      assert index_live
             |> form("#colonia-form", colonia: @invalid_attrs)
             |> render_change() =~ "can&apos;t be blank"

      {:ok, _, html} =
        index_live
        |> form("#colonia-form", colonia: @update_attrs)
        |> render_submit()
        |> follow_redirect(conn, Routes.colonia_index_path(conn, :index))

      assert html =~ "Colonia updated successfully"
      assert html =~ "some updated clave"
    end

    test "deletes colonia in listing", %{conn: conn, colonia: colonia} do
      {:ok, index_live, _html} = live(conn, Routes.colonia_index_path(conn, :index))

      assert index_live |> element("#colonia-#{colonia.id} a", "Delete") |> render_click()
      refute has_element?(index_live, "#colonia-#{colonia.id}")
    end
  end

  describe "Show" do
    setup [:create_colonia]

    test "displays colonia", %{conn: conn, colonia: colonia} do
      {:ok, _show_live, html} = live(conn, Routes.colonia_show_path(conn, :show, colonia))

      assert html =~ "Show Colonia"
      assert html =~ colonia.clave
    end

    test "updates colonia within modal", %{conn: conn, colonia: colonia} do
      {:ok, show_live, _html} = live(conn, Routes.colonia_show_path(conn, :show, colonia))

      assert show_live |> element("a", "Edit") |> render_click() =~
               "Edit Colonia"

      assert_patch(show_live, Routes.colonia_show_path(conn, :edit, colonia))

      assert show_live
             |> form("#colonia-form", colonia: @invalid_attrs)
             |> render_change() =~ "can&apos;t be blank"

      {:ok, _, html} =
        show_live
        |> form("#colonia-form", colonia: @update_attrs)
        |> render_submit()
        |> follow_redirect(conn, Routes.colonia_show_path(conn, :show, colonia))

      assert html =~ "Colonia updated successfully"
      assert html =~ "some updated clave"
    end
  end
end
