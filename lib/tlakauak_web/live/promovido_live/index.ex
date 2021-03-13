defmodule TlakauakWeb.PromovidoLive.Index do
  use TlakauakWeb, :live_view

  alias Tlakauak.AbmPadron
  alias Tlakauak.AbmPadron.Promovido

  @impl true
  def mount(_params, _session, socket) do
    {:ok, assign(socket, :promovidos, list_promovidos())}
  end

  @impl true
  def handle_params(params, _url, socket) do
    {:noreply, apply_action(socket, socket.assigns.live_action, params)}
  end

  defp apply_action(socket, :edit, %{"id" => id}) do
    socket
    |> assign(:page_title, "Editar Promovido")
    |> assign(:promovido, AbmPadron.get_promovido!(id))
  end

  defp apply_action(socket, :new, _params) do
    socket
    |> assign(:page_title, "Agregar Promovido")
    |> assign(:promovido, %Promovido{})
  end

  defp apply_action(socket, :index, _params) do
    socket
    |> assign(:page_title, "Lista de Promovidos")
    |> assign(:promovido, nil)
  end

  @impl true
  def handle_event("delete", %{"id" => id}, socket) do
    promovido = AbmPadron.get_promovido!(id)
    {:ok, _} = AbmPadron.delete_promovido(promovido)

    {:noreply, assign(socket, :promovidos, list_promovidos())}
  end

  defp list_promovidos do
    AbmPadron.list_promovidos()
    |> IO.inspect(label: "list_promovidos")
  end
end
