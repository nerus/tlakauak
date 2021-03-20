defmodule TlakauakWeb.PromovidoLive.Index do
  use TlakauakWeb, :live_view

  alias Tlakauak.AbmPadron
  alias Tlakauak.AbmPadron.Promovido

  @impl true
  def mount(_params, session, socket) do
    #session |> IO.inspect(label: "PromovidoLive.mount")
    user = Tlakauak.Accounts.get_user_by_session_token(session["user_token"]) 
    {:ok, assign(socket, 
      promovidos: AbmPadron.list_promovidos(), 
      session_id: session["live_socket_id"],
      user_id: user.id,
    )}
    # |> IO.inspect(label: "result.mount")
  end

  @impl true
  def handle_params(params, _url, socket) do
    #socket.assigns |> IO.inspect(label: "PromovidoLive.handle_params") jWDUXb77nnfWuCN

    {:noreply, apply_action(socket, socket.assigns.live_action, params)}
  end

  defp apply_action(socket, :edit, %{"id" => id}) do
    socket
    |> assign(:page_title, "Editar Promovido")
    |> assign(:promovido, AbmPadron.get_promovido!(id))
  end

  defp apply_action(socket, :new, _params) do
    #socket.assigns |> IO.inspect(label: "PromovidoLive.apply_action new")

    socket
    |> assign(:page_title, "Agregar Promovido")
    |> assign(:promovido, %Promovido{user_id: socket.assigns.user_id, session_id: socket.assigns.session_id})
    
    # |> IO.inspect(label: "PromovidoLive.apply_action new")
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
  end
end
