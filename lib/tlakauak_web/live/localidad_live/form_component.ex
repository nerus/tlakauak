defmodule TlakauakWeb.LocalidadLive.FormComponent do
  use TlakauakWeb, :live_component

  alias Tlakauak.AbmLocalidad

  @impl true
  def update(%{localidad: localidad} = assigns, socket) do
    changeset = AbmLocalidad.change_localidad(localidad)

    {:ok,
     socket
     |> assign(assigns)
     |> assign(:changeset, changeset)}
  end

  @impl true
  def handle_event("validate", %{"localidad" => localidad_params}, socket) do
    changeset =
      socket.assigns.localidad
      |> AbmLocalidad.change_localidad(localidad_params)
      |> Map.put(:action, :validate)

    {:noreply, assign(socket, :changeset, changeset)}
  end

  def handle_event("save", %{"localidad" => localidad_params}, socket) do
    save_localidad(socket, socket.assigns.action, localidad_params)
  end

  defp save_localidad(socket, :edit, localidad_params) do
    case AbmLocalidad.update_localidad(socket.assigns.localidad, localidad_params) do
      {:ok, _localidad} ->
        {:noreply,
         socket
         |> put_flash(:info, "Localidad updated successfully")
         |> push_redirect(to: socket.assigns.return_to)}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign(socket, :changeset, changeset)}
    end
  end

  defp save_localidad(socket, :new, localidad_params) do
    case AbmLocalidad.create_localidad(localidad_params) do
      {:ok, _localidad} ->
        {:noreply,
         socket
         |> put_flash(:info, "Localidad created successfully")
         |> push_redirect(to: socket.assigns.return_to)}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign(socket, changeset: changeset)}
    end
  end
end
