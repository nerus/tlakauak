defmodule TlakauakWeb.PromovidoLive.FormComponent do
  use TlakauakWeb, :live_component

  alias Tlakauak.AbmPadron
  alias Tlakauak.Abm_Colonia
  alias Tlakauak.AbmLocalidad
  alias Tlakauak.Abm_Promotor

  @impl true
  def update(%{promovido: promovido} = assigns, socket) do
    changeset = AbmPadron.change_promovido(promovido)

    {:ok,
     socket
     |> assign(assigns)
     |> assign(:promotores, Abm_Promotor.list_promotores())
     |> assign(:colonias, Abm_Colonia.list_colonias())
     |> assign(:localidades, AbmLocalidad.list_localidades())
     |> assign(:changeset, changeset)}
  end

  @impl true
  def handle_event("validate", %{"promovido" => promovido_params}, socket) do
    changeset =
      socket.assigns.promovido
      |> AbmPadron.change_promovido(promovido_params)
      |> Map.put(:action, :validate)

    {:noreply, assign(socket, :changeset, changeset)}
  end

  def handle_event("save", %{"promovido" => promovido_params}, socket) do
    save_promovido(socket, socket.assigns.action, promovido_params)
  end

  defp save_promovido(socket, :edit, promovido_params) do
    case AbmPadron.update_promovido(socket.assigns.promovido, promovido_params) do
      {:ok, _promovido} ->
        {:noreply,
         socket
         |> put_flash(:info, "Promovido updated successfully")
         |> push_redirect(to: socket.assigns.return_to)}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign(socket, :changeset, changeset)}
    end
  end

  defp save_promovido(socket, :new, promovido_params) do
    case AbmPadron.create_promovido(promovido_params) do
      {:ok, _promovido} ->
        {:noreply,
         socket
         |> put_flash(:info, "Promovido created successfully")
         |> push_redirect(to: socket.assigns.return_to)}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign(socket, changeset: changeset)}
    end
  end
end
