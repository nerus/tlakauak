defmodule TlakauakWeb.PromotorLive.Index do
  use TlakauakWeb, :live_view

  alias Tlakauak.Abm_Promotor
  alias Tlakauak.Abm_Promotor.Promotor
  alias Tlakauak.Abm_Coordinador

  @impl true
  def mount(_params, _session, socket) do
    {:ok, assign(socket, :promotores, Abm_Promotor.list_promotores())}
  end

  @impl true
  def handle_params(params, _url, socket) do
    {:noreply, apply_action(socket, socket.assigns.live_action, params)}
  end

  defp apply_action(socket, :edit, %{"id" => id}) do
    socket
    |> assign(:page_title, "Editar Promotor")
    |> assign(:promotor, Abm_Promotor.get_promotor!(id))
  end

  defp apply_action(socket, :new, _params) do
    socket
    |> assign(:page_title, "Nuevo Promotor")
    |> assign(:promotor, %Promotor{})
  end

  defp apply_action(socket, :index, _params) do
    socket
    |> assign(:page_title, "Lista de Promotores")
    |> assign(:promotor, nil)
  end

  @impl true
  def handle_event("delete", %{"id" => id}, socket) do
    promotor = Abm_Promotor.get_promotor!(id)
    {:ok, _} = Abm_Promotor.delete_promotor(promotor)

    {:noreply, assign(socket, :promotores, Abm_Promotor.list_promotores())}
  end
end
