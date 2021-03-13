defmodule TlakauakWeb.PromotorLiveTest do
  use TlakauakWeb.ConnCase

  import Phoenix.LiveViewTest

  alias Tlakauak.Catalogo

  @create_attrs %{clave: "some clave", descripcion: "some descripcion"}
  @update_attrs %{clave: "some updated clave", descripcion: "some updated descripcion"}
  @invalid_attrs %{clave: nil, descripcion: nil}

  defp fixture(:promotor) do
    {:ok, promotor} = Catalogo.create_promotor(@create_attrs)
    promotor
  end

  defp create_promotor(_) do
    promotor = fixture(:promotor)
    %{promotor: promotor}
  end

  describe "Index" do
    setup [:create_promotor]

    test "lists all promotores", %{conn: conn, promotor: promotor} do
      {:ok, _index_live, html} = live(conn, Routes.promotor_index_path(conn, :index))

      assert html =~ "Listing Promotores"
      assert html =~ promotor.clave
    end

    test "saves new promotor", %{conn: conn} do
      {:ok, index_live, _html} = live(conn, Routes.promotor_index_path(conn, :index))

      assert index_live |> element("a", "New Promotor") |> render_click() =~
               "New Promotor"

      assert_patch(index_live, Routes.promotor_index_path(conn, :new))

      assert index_live
             |> form("#promotor-form", promotor: @invalid_attrs)
             |> render_change() =~ "can&apos;t be blank"

      {:ok, _, html} =
        index_live
        |> form("#promotor-form", promotor: @create_attrs)
        |> render_submit()
        |> follow_redirect(conn, Routes.promotor_index_path(conn, :index))

      assert html =~ "Promotor created successfully"
      assert html =~ "some clave"
    end

    test "updates promotor in listing", %{conn: conn, promotor: promotor} do
      {:ok, index_live, _html} = live(conn, Routes.promotor_index_path(conn, :index))

      assert index_live |> element("#promotor-#{promotor.id} a", "Edit") |> render_click() =~
               "Edit Promotor"

      assert_patch(index_live, Routes.promotor_index_path(conn, :edit, promotor))

      assert index_live
             |> form("#promotor-form", promotor: @invalid_attrs)
             |> render_change() =~ "can&apos;t be blank"

      {:ok, _, html} =
        index_live
        |> form("#promotor-form", promotor: @update_attrs)
        |> render_submit()
        |> follow_redirect(conn, Routes.promotor_index_path(conn, :index))

      assert html =~ "Promotor updated successfully"
      assert html =~ "some updated clave"
    end

    test "deletes promotor in listing", %{conn: conn, promotor: promotor} do
      {:ok, index_live, _html} = live(conn, Routes.promotor_index_path(conn, :index))

      assert index_live |> element("#promotor-#{promotor.id} a", "Delete") |> render_click()
      refute has_element?(index_live, "#promotor-#{promotor.id}")
    end
  end

  describe "Show" do
    setup [:create_promotor]

    test "displays promotor", %{conn: conn, promotor: promotor} do
      {:ok, _show_live, html} = live(conn, Routes.promotor_show_path(conn, :show, promotor))

      assert html =~ "Show Promotor"
      assert html =~ promotor.clave
    end

    test "updates promotor within modal", %{conn: conn, promotor: promotor} do
      {:ok, show_live, _html} = live(conn, Routes.promotor_show_path(conn, :show, promotor))

      assert show_live |> element("a", "Edit") |> render_click() =~
               "Edit Promotor"

      assert_patch(show_live, Routes.promotor_show_path(conn, :edit, promotor))

      assert show_live
             |> form("#promotor-form", promotor: @invalid_attrs)
             |> render_change() =~ "can&apos;t be blank"

      {:ok, _, html} =
        show_live
        |> form("#promotor-form", promotor: @update_attrs)
        |> render_submit()
        |> follow_redirect(conn, Routes.promotor_show_path(conn, :show, promotor))

      assert html =~ "Promotor updated successfully"
      assert html =~ "some updated clave"
    end
  end
end
