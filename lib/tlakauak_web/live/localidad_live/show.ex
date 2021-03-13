defmodule TlakauakWeb.LocalidadLive.Show do
  use TlakauakWeb, :live_view

  alias Tlakauak.AbmLocalidad

  @impl true
  def mount(_params, _session, socket) do
    {:ok, socket}
  end

  @impl true
  def handle_params(%{"id" => id}, _, socket) do
    {:noreply,
     socket
     |> assign(:page_title, page_title(socket.assigns.live_action))
     |> assign(:localidad, AbmLocalidad.get_localidad!(id))}
  end

  defp page_title(:show), do: "Mostrar Localidad"
  defp page_title(:edit), do: "Editar Localidad"
end
