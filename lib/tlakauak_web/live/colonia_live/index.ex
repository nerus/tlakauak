defmodule TlakauakWeb.ColoniaLive.Index do
  use TlakauakWeb, :live_view

  alias Tlakauak.Abm_Colonia
  alias Tlakauak.Abm_Colonia.Colonia

  @impl true
  def mount(_params, _session, socket) do
    {:ok, assign(socket, :colonias, list_colonias())}
  end

  @impl true
  def handle_params(params, _url, socket) do
    {:noreply, apply_action(socket, socket.assigns.live_action, params)}
  end

  defp apply_action(socket, :edit, %{"id" => id}) do
    socket
    |> assign(:page_title, "Editar Colonia")
    |> assign(:colonia, Abm_Colonia.get_colonia!(id))
  end

  defp apply_action(socket, :new, _params) do
    socket
    |> assign(:page_title, "Agregar Colonia")
    |> assign(:colonia, %Colonia{})
  end

  defp apply_action(socket, :index, _params) do
    socket
    |> assign(:page_title, "Lista de Colonias")
    |> assign(:colonia, nil)
  end

  @impl true
  def handle_event("delete", %{"id" => id}, socket) do
    colonia = Abm_Colonia.get_colonia!(id)
    {:ok, _} = Abm_Colonia.delete_colonia(colonia)

    {:noreply, assign(socket, :colonias, list_colonias())}
  end

  defp list_colonias do
    Abm_Colonia.list_colonias()
  end
end
