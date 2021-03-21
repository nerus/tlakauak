defmodule TlakauakWeb.CoordinadorLive.Index do
  use TlakauakWeb, :live_view

  alias Tlakauak.Abm_Coordinador
  alias Tlakauak.Abm_Coordinador.Coordinador

  @impl true
  def mount(_params, session, socket) do
    user = Tlakauak.Accounts.get_user_by_session_token(session["user_token"]) 
    {:ok, assign(socket, 
    coordinadores: list_coordinadores(),
    session_id: session["live_socket_id"],
    user_id: user.id,
    )}
  end

  @impl true
  def handle_params(params, _url, socket) do
    {:noreply, apply_action(socket, socket.assigns.live_action, params)}
  end

  defp apply_action(socket, :edit, %{"id" => id}) do
    socket
    |> assign(:page_title, "Editar Coordinador")
    |> assign(:coordinador, Abm_Coordinador.get_coordinador!(id))
  end

  defp apply_action(socket, :new, _params) do
    socket
    |> assign(:page_title, "Agregar Coordinador")
    |> assign(:coordinador, %Coordinador{user_id: socket.assigns.user_id, session_id: socket.assigns.session_id})
  end

  defp apply_action(socket, :index, _params) do
    socket
    |> assign(:page_title, "Lista de Coordinadores")
    |> assign(:coordinador, nil)
  end

  @impl true
  def handle_event("delete", %{"id" => id}, socket) do
    coordinador = Abm_Coordinador.get_coordinador!(id)
    {:ok, _} = Abm_Coordinador.delete_coordinador(coordinador)

    {:noreply, assign(socket, :coordinadores, list_coordinadores())}
  end

  defp list_coordinadores do
    Abm_Coordinador.list_coordinadores()
  end
end
