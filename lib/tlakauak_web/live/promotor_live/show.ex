defmodule TlakauakWeb.PromotorLive.Show do
  use TlakauakWeb, :live_view

  alias Tlakauak.Abm_Promotor

  @impl true
  def mount(_params, _session, socket) do
    {:ok, socket}
  end

  @impl true
  def handle_params(%{"id" => id}, _, socket) do
    {:noreply,
     socket
     |> assign(:page_title, page_title(socket.assigns.live_action))
     |> assign(:promotor, Abm_Promotor.get_promotor!(id))}
  end

  defp page_title(:show), do: "Mostrar Promotor"
  defp page_title(:edit), do: "Editar Promotor"
end
