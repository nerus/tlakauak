defmodule TlakauakWeb.PromovidoLive.Show do
  use TlakauakWeb, :live_view

  alias Tlakauak.AbmPadron

  @impl true
  def mount(_params, _session, socket) do
    {:ok, socket}
  end

  @impl true
  def handle_params(%{"id" => id}, _, socket) do
    {:noreply,
     socket
     |> assign(:page_title, page_title(socket.assigns.live_action))
     |> assign(:promovido, AbmPadron.get_promovido!(id))}
  end

  defp page_title(:show), do: "Mostrar Promovido"
  defp page_title(:edit), do: "Editar Promovido"
end
