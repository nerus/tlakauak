defmodule TlakauakWeb.LocalidadLive.Index do
  use TlakauakWeb, :live_view

  alias Tlakauak.AbmLocalidad
  alias Tlakauak.AbmLocalidad.Localidad

  @impl true
  def mount(_params, _session, socket) do
    {:ok, assign(socket, :localidades, list_localidades())}
  end

  @impl true
  def handle_params(params, _url, socket) do
    {:noreply, apply_action(socket, socket.assigns.live_action, params)}
  end

  defp apply_action(socket, :edit, %{"id" => id}) do
    socket
    |> assign(:page_title, "Editar Localidad")
    |> assign(:localidad, AbmLocalidad.get_localidad!(id))
  end

  defp apply_action(socket, :new, _params) do
    socket
    |> assign(:page_title, "Agregar Localidad")
    |> assign(:localidad, %Localidad{})
  end

  defp apply_action(socket, :index, _params) do
    socket
    |> assign(:page_title, "Lista de Localidades")
    |> assign(:localidad, nil)
  end

  @impl true
  def handle_event("delete", %{"id" => id}, socket) do
    localidad = AbmLocalidad.get_localidad!(id)
    {:ok, _} = AbmLocalidad.delete_localidad(localidad)

    {:noreply, assign(socket, :localidades, list_localidades())}
  end

  defp list_localidades do
    AbmLocalidad.list_localidades()
  end
end
