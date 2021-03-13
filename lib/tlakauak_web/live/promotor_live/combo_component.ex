defmodule TlakauakWeb.PromotorLive.ComboComponent do
  use TlakauakWeb, :live_component
  @impl true
  def update(%{promotores: promotores} = assigns, socket) do

    {:ok,
     socket
     |> assign(assigns)}

  end
end