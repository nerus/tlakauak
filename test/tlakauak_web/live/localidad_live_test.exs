defmodule TlakauakWeb.LocalidadLiveTest do
  use TlakauakWeb.ConnCase

  import Phoenix.LiveViewTest

  alias Tlakauak.AbmLocalidad

  @create_attrs %{clave: "some clave", descripcion: "some descripcion", inactivo: true}
  @update_attrs %{clave: "some updated clave", descripcion: "some updated descripcion", inactivo: false}
  @invalid_attrs %{clave: nil, descripcion: nil, inactivo: nil}

  defp fixture(:localidad) do
    {:ok, localidad} = AbmLocalidad.create_localidad(@create_attrs)
    localidad
  end

  defp create_localidad(_) do
    localidad = fixture(:localidad)
    %{localidad: localidad}
  end

  describe "Index" do
    setup [:create_localidad]

    test "lists all localidades", %{conn: conn, localidad: localidad} do
      {:ok, _index_live, html} = live(conn, Routes.localidad_index_path(conn, :index))

      assert html =~ "Listing Localidades"
      assert html =~ localidad.clave
    end

    test "saves new localidad", %{conn: conn} do
      {:ok, index_live, _html} = live(conn, Routes.localidad_index_path(conn, :index))

      assert index_live |> element("a", "New Localidad") |> render_click() =~
               "New Localidad"

      assert_patch(index_live, Routes.localidad_index_path(conn, :new))

      assert index_live
             |> form("#localidad-form", localidad: @invalid_attrs)
             |> render_change() =~ "can&apos;t be blank"

      {:ok, _, html} =
        index_live
        |> form("#localidad-form", localidad: @create_attrs)
        |> render_submit()
        |> follow_redirect(conn, Routes.localidad_index_path(conn, :index))

      assert html =~ "Localidad created successfully"
      assert html =~ "some clave"
    end

    test "updates localidad in listing", %{conn: conn, localidad: localidad} do
      {:ok, index_live, _html} = live(conn, Routes.localidad_index_path(conn, :index))

      assert index_live |> element("#localidad-#{localidad.id} a", "Edit") |> render_click() =~
               "Edit Localidad"

      assert_patch(index_live, Routes.localidad_index_path(conn, :edit, localidad))

      assert index_live
             |> form("#localidad-form", localidad: @invalid_attrs)
             |> render_change() =~ "can&apos;t be blank"

      {:ok, _, html} =
        index_live
        |> form("#localidad-form", localidad: @update_attrs)
        |> render_submit()
        |> follow_redirect(conn, Routes.localidad_index_path(conn, :index))

      assert html =~ "Localidad updated successfully"
      assert html =~ "some updated clave"
    end

    test "deletes localidad in listing", %{conn: conn, localidad: localidad} do
      {:ok, index_live, _html} = live(conn, Routes.localidad_index_path(conn, :index))

      assert index_live |> element("#localidad-#{localidad.id} a", "Delete") |> render_click()
      refute has_element?(index_live, "#localidad-#{localidad.id}")
    end
  end

  describe "Show" do
    setup [:create_localidad]

    test "displays localidad", %{conn: conn, localidad: localidad} do
      {:ok, _show_live, html} = live(conn, Routes.localidad_show_path(conn, :show, localidad))

      assert html =~ "Show Localidad"
      assert html =~ localidad.clave
    end

    test "updates localidad within modal", %{conn: conn, localidad: localidad} do
      {:ok, show_live, _html} = live(conn, Routes.localidad_show_path(conn, :show, localidad))

      assert show_live |> element("a", "Edit") |> render_click() =~
               "Edit Localidad"

      assert_patch(show_live, Routes.localidad_show_path(conn, :edit, localidad))

      assert show_live
             |> form("#localidad-form", localidad: @invalid_attrs)
             |> render_change() =~ "can&apos;t be blank"

      {:ok, _, html} =
        show_live
        |> form("#localidad-form", localidad: @update_attrs)
        |> render_submit()
        |> follow_redirect(conn, Routes.localidad_show_path(conn, :show, localidad))

      assert html =~ "Localidad updated successfully"
      assert html =~ "some updated clave"
    end
  end
end
