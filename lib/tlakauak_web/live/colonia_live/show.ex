defmodule TlakauakWeb.ColoniaLive.Show do
  use TlakauakWeb, :live_view

  alias Tlakauak.Abm_Colonia

  @impl true
  def mount(_params, _session, socket) do
    {:ok, socket}
  end

  @impl true
  def handle_params(%{"id" => id}, _, socket) do
    {:noreply,
     socket
     |> assign(:page_title, page_title(socket.assigns.live_action))
     |> assign(:colonia, Abm_Colonia.get_colonia!(id))}
  end

  defp page_title(:show), do: "Mostrar Colonia"
  defp page_title(:edit), do: "Editar Colonia"
end
