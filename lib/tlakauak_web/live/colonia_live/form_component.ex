defmodule TlakauakWeb.ColoniaLive.FormComponent do
  use TlakauakWeb, :live_component

  alias Tlakauak.Abm_Colonia

  @impl true
  def update(%{colonia: colonia} = assigns, socket) do
    changeset = Abm_Colonia.change_colonia(colonia)

    {:ok,
     socket
     |> assign(assigns)
     |> assign(:changeset, changeset)}
  end

  @impl true
  def handle_event("validate", %{"colonia" => colonia_params}, socket) do
    changeset =
      socket.assigns.colonia
      |> Abm_Colonia.change_colonia(colonia_params)
      |> Map.put(:action, :validate)

    {:noreply, assign(socket, :changeset, changeset)}
  end

  def handle_event("save", %{"colonia" => colonia_params}, socket) do
    save_colonia(socket, socket.assigns.action, colonia_params)
  end

  defp save_colonia(socket, :edit, colonia_params) do
    case Abm_Colonia.update_colonia(socket.assigns.colonia, colonia_params) do
      {:ok, _colonia} ->
        {:noreply,
         socket
         |> put_flash(:info, "Colonia updated successfully")
         |> push_redirect(to: socket.assigns.return_to)}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign(socket, :changeset, changeset)}
    end
  end

  defp save_colonia(socket, :new, colonia_params) do
    case Abm_Colonia.create_colonia(colonia_params) do
      {:ok, _colonia} ->
        {:noreply,
         socket
         |> put_flash(:info, "Colonia created successfully")
         |> push_redirect(to: socket.assigns.return_to)}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign(socket, changeset: changeset)}
    end
  end
end
