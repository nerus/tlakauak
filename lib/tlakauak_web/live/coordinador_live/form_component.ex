defmodule TlakauakWeb.CoordinadorLive.FormComponent do
  use TlakauakWeb, :live_component

  alias Tlakauak.Abm_Coordinador

  @impl true
  def update(%{coordinador: coordinador} = assigns, socket) do
    changeset = Abm_Coordinador.change_coordinador(coordinador)

    {:ok,
     socket
     |> assign(assigns)
     |> assign(:changeset, changeset)}
  end

  @impl true
  def handle_event("validate", %{"coordinador" => coordinador_params}, socket) do
    changeset =
      socket.assigns.coordinador
      |> Abm_Coordinador.change_coordinador(coordinador_params)
      |> Map.put(:action, :validate)

    {:noreply, assign(socket, :changeset, changeset)}
  end

  def handle_event("save", %{"coordinador" => coordinador_params}, socket) do
    save_coordinador(socket, socket.assigns.action, coordinador_params)
  end

  defp save_coordinador(socket, :edit, coordinador_params) do
    case Abm_Coordinador.update_coordinador(socket.assigns.coordinador, coordinador_params) do
      {:ok, _coordinador} ->
        {:noreply,
         socket
         |> put_flash(:info, "Coordinador updated successfully")
         |> push_redirect(to: socket.assigns.return_to)}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign(socket, :changeset, changeset)}
    end
  end

  defp save_coordinador(socket, :new, coordinador_params) do
    case Abm_Coordinador.create_coordinador(coordinador_params) do
      {:ok, _coordinador} ->
        {:noreply,
         socket
         |> put_flash(:info, "Coordinador created successfully")
         |> push_redirect(to: socket.assigns.return_to)}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign(socket, changeset: changeset)}
    end
  end
end
