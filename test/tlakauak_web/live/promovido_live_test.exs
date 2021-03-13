defmodule TlakauakWeb.PromovidoLiveTest do
  use TlakauakWeb.ConnCase

  import Phoenix.LiveViewTest

  alias Tlakauak.AbmPadron

  @create_attrs %{clave: "some clave", colonia_id: 42, coordinador_id: 42, descripcion: "some descripcion", direccion: "some direccion", inactivo: true, localidad_id: 42, promotor_id: 42, seccional: "some seccional", telefono: "some telefono"}
  @update_attrs %{clave: "some updated clave", colonia_id: 43, coordinador_id: 43, descripcion: "some updated descripcion", direccion: "some updated direccion", inactivo: false, localidad_id: 43, promotor_id: 43, seccional: "some updated seccional", telefono: "some updated telefono"}
  @invalid_attrs %{clave: nil, colonia_id: nil, coordinador_id: nil, descripcion: nil, direccion: nil, inactivo: nil, localidad_id: nil, promotor_id: nil, seccional: nil, telefono: nil}

  defp fixture(:promovido) do
    {:ok, promovido} = AbmPadron.create_promovido(@create_attrs)
    promovido
  end

  defp create_promovido(_) do
    promovido = fixture(:promovido)
    %{promovido: promovido}
  end

  describe "Index" do
    setup [:create_promovido]

    test "lists all promovidos", %{conn: conn, promovido: promovido} do
      {:ok, _index_live, html} = live(conn, Routes.promovido_index_path(conn, :index))

      assert html =~ "Listing Promovidos"
      assert html =~ promovido.clave
    end

    test "saves new promovido", %{conn: conn} do
      {:ok, index_live, _html} = live(conn, Routes.promovido_index_path(conn, :index))

      assert index_live |> element("a", "New Promovido") |> render_click() =~
               "New Promovido"

      assert_patch(index_live, Routes.promovido_index_path(conn, :new))

      assert index_live
             |> form("#promovido-form", promovido: @invalid_attrs)
             |> render_change() =~ "can&apos;t be blank"

      {:ok, _, html} =
        index_live
        |> form("#promovido-form", promovido: @create_attrs)
        |> render_submit()
        |> follow_redirect(conn, Routes.promovido_index_path(conn, :index))

      assert html =~ "Promovido created successfully"
      assert html =~ "some clave"
    end

    test "updates promovido in listing", %{conn: conn, promovido: promovido} do
      {:ok, index_live, _html} = live(conn, Routes.promovido_index_path(conn, :index))

      assert index_live |> element("#promovido-#{promovido.id} a", "Edit") |> render_click() =~
               "Edit Promovido"

      assert_patch(index_live, Routes.promovido_index_path(conn, :edit, promovido))

      assert index_live
             |> form("#promovido-form", promovido: @invalid_attrs)
             |> render_change() =~ "can&apos;t be blank"

      {:ok, _, html} =
        index_live
        |> form("#promovido-form", promovido: @update_attrs)
        |> render_submit()
        |> follow_redirect(conn, Routes.promovido_index_path(conn, :index))

      assert html =~ "Promovido updated successfully"
      assert html =~ "some updated clave"
    end

    test "deletes promovido in listing", %{conn: conn, promovido: promovido} do
      {:ok, index_live, _html} = live(conn, Routes.promovido_index_path(conn, :index))

      assert index_live |> element("#promovido-#{promovido.id} a", "Delete") |> render_click()
      refute has_element?(index_live, "#promovido-#{promovido.id}")
    end
  end

  describe "Show" do
    setup [:create_promovido]

    test "displays promovido", %{conn: conn, promovido: promovido} do
      {:ok, _show_live, html} = live(conn, Routes.promovido_show_path(conn, :show, promovido))

      assert html =~ "Show Promovido"
      assert html =~ promovido.clave
    end

    test "updates promovido within modal", %{conn: conn, promovido: promovido} do
      {:ok, show_live, _html} = live(conn, Routes.promovido_show_path(conn, :show, promovido))

      assert show_live |> element("a", "Edit") |> render_click() =~
               "Edit Promovido"

      assert_patch(show_live, Routes.promovido_show_path(conn, :edit, promovido))

      assert show_live
             |> form("#promovido-form", promovido: @invalid_attrs)
             |> render_change() =~ "can&apos;t be blank"

      {:ok, _, html} =
        show_live
        |> form("#promovido-form", promovido: @update_attrs)
        |> render_submit()
        |> follow_redirect(conn, Routes.promovido_show_path(conn, :show, promovido))

      assert html =~ "Promovido updated successfully"
      assert html =~ "some updated clave"
    end
  end
end
