defmodule TlakauakWeb.CoordinadorLiveTest do
  use TlakauakWeb.ConnCase

  import Phoenix.LiveViewTest

  alias Tlakauak.Abm_Coordinador

  @create_attrs %{clave: "some clave", descripcion: "some descripcion"}
  @update_attrs %{clave: "some updated clave", descripcion: "some updated descripcion"}
  @invalid_attrs %{clave: nil, descripcion: nil}

  defp fixture(:coordinador) do
    {:ok, coordinador} = Abm_Coordinador.create_coordinador(@create_attrs)
    coordinador
  end

  defp create_coordinador(_) do
    coordinador = fixture(:coordinador)
    %{coordinador: coordinador}
  end

  describe "Index" do
    setup [:create_coordinador]

    test "lists all coordinadores", %{conn: conn, coordinador: coordinador} do
      {:ok, _index_live, html} = live(conn, Routes.coordinador_index_path(conn, :index))

      assert html =~ "Listing Coordinadores"
      assert html =~ coordinador.clave
    end

    test "saves new coordinador", %{conn: conn} do
      {:ok, index_live, _html} = live(conn, Routes.coordinador_index_path(conn, :index))

      assert index_live |> element("a", "New Coordinador") |> render_click() =~
               "New Coordinador"

      assert_patch(index_live, Routes.coordinador_index_path(conn, :new))

      assert index_live
             |> form("#coordinador-form", coordinador: @invalid_attrs)
             |> render_change() =~ "can&apos;t be blank"

      {:ok, _, html} =
        index_live
        |> form("#coordinador-form", coordinador: @create_attrs)
        |> render_submit()
        |> follow_redirect(conn, Routes.coordinador_index_path(conn, :index))

      assert html =~ "Coordinador created successfully"
      assert html =~ "some clave"
    end

    test "updates coordinador in listing", %{conn: conn, coordinador: coordinador} do
      {:ok, index_live, _html} = live(conn, Routes.coordinador_index_path(conn, :index))

      assert index_live |> element("#coordinador-#{coordinador.id} a", "Edit") |> render_click() =~
               "Edit Coordinador"

      assert_patch(index_live, Routes.coordinador_index_path(conn, :edit, coordinador))

      assert index_live
             |> form("#coordinador-form", coordinador: @invalid_attrs)
             |> render_change() =~ "can&apos;t be blank"

      {:ok, _, html} =
        index_live
        |> form("#coordinador-form", coordinador: @update_attrs)
        |> render_submit()
        |> follow_redirect(conn, Routes.coordinador_index_path(conn, :index))

      assert html =~ "Coordinador updated successfully"
      assert html =~ "some updated clave"
    end

    test "deletes coordinador in listing", %{conn: conn, coordinador: coordinador} do
      {:ok, index_live, _html} = live(conn, Routes.coordinador_index_path(conn, :index))

      assert index_live |> element("#coordinador-#{coordinador.id} a", "Delete") |> render_click()
      refute has_element?(index_live, "#coordinador-#{coordinador.id}")
    end
  end

  describe "Show" do
    setup [:create_coordinador]

    test "displays coordinador", %{conn: conn, coordinador: coordinador} do
      {:ok, _show_live, html} = live(conn, Routes.coordinador_show_path(conn, :show, coordinador))

      assert html =~ "Show Coordinador"
      assert html =~ coordinador.clave
    end

    test "updates coordinador within modal", %{conn: conn, coordinador: coordinador} do
      {:ok, show_live, _html} = live(conn, Routes.coordinador_show_path(conn, :show, coordinador))

      assert show_live |> element("a", "Edit") |> render_click() =~
               "Edit Coordinador"

      assert_patch(show_live, Routes.coordinador_show_path(conn, :edit, coordinador))

      assert show_live
             |> form("#coordinador-form", coordinador: @invalid_attrs)
             |> render_change() =~ "can&apos;t be blank"

      {:ok, _, html} =
        show_live
        |> form("#coordinador-form", coordinador: @update_attrs)
        |> render_submit()
        |> follow_redirect(conn, Routes.coordinador_show_path(conn, :show, coordinador))

      assert html =~ "Coordinador updated successfully"
      assert html =~ "some updated clave"
    end
  end
end
