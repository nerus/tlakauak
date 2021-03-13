defmodule TlakauakWeb.PromotorLive.FormComponent do
  use TlakauakWeb, :live_component

  alias Tlakauak.Abm_Promotor
  alias Tlakauak.Abm_Coordinador

  @impl true
  def update(%{promotor: promotor} = assigns, socket) do
    changeset = Abm_Promotor.change_promotor(promotor)
    
    # coordinadores = Abm_Coordinador.list_coordinadores()
    # |> list_coordinadores()
    # assigns |> IO.inspect(label: "update_FormComponent")

    {:ok,
     socket
     |> assign(assigns)
     |> assign(:coordinadores, Abm_Coordinador.list_coordinadores())
     |> assign(:changeset, changeset)}
  end

  @impl true
  def handle_event("validate", %{"promotor" => promotor_params}, socket) do
    promotor_params |>IO.inspect(label: "validate")

    changeset =
      socket.assigns.promotor
      |> Abm_Promotor.change_promotor(promotor_params)
      |> Map.put(:action, :validate)

    {:noreply, assign(socket, :changeset, changeset)}
  end

  def handle_event("save", %{"promotor" => promotor_params}, socket) do
    save_promotor(socket, socket.assigns.action, promotor_params)
  end

  defp save_promotor(socket, :edit, promotor_params) do
    case Abm_Promotor.update_promotor(socket.assigns.promotor, promotor_params) do
      {:ok, _promotor} ->
        {:noreply,
         socket
         |> put_flash(:info, "Promotor updated successfully")
         |> push_redirect(to: socket.assigns.return_to)}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign(socket, :changeset, changeset)}
    end
  end

  defp save_promotor(socket, :new, promotor_params) do
    case Abm_Promotor.create_promotor(promotor_params) do
      {:ok, _promotor} ->
        {:noreply,
         socket
         |> put_flash(:info, "Promotor created successfully")
         |> push_redirect(to: socket.assigns.return_to)}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign(socket, changeset: changeset)}
    end
  end

  defp list_coordinadores(coordinadores) do
    coordinadores
    |> Enum.map(fn x -> &{&1.descripcion, &1.id} end)
  end
end
