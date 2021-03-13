defmodule TlakauakWeb.CoordinadorLive.Show do
  use TlakauakWeb, :live_view

  alias Tlakauak.Abm_Coordinador

  @impl true
  def mount(_params, _session, socket) do
    {:ok, socket}
  end

  @impl true
  def handle_params(%{"id" => id}, _, socket) do
    {:noreply,
     socket
     |> assign(:page_title, page_title(socket.assigns.live_action))
     |> assign(:coordinador, Abm_Coordinador.get_coordinador!(id))}
  end

  defp page_title(:show), do: "Mostrar Coordinador"
  defp page_title(:edit), do: "Editar Coordinador"
end
