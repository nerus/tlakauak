defmodule TlakauakWeb.LiveHelpers do
  import Phoenix.LiveView.Helpers

  @doc """
  Renders a component inside the `TlakauakWeb.ModalComponent` component.

  The rendered modal receives a `:return_to` option to properly update
  the URL when the modal is closed.

  ## Examples

      <%= live_modal @socket, TlakauakWeb.PromotorLive.FormComponent,
        id: @promotor.id || :new,
        action: @live_action,
        promotor: @promotor,
        return_to: Routes.promotor_index_path(@socket, :index) %>
  """
  def live_modal(socket, component, opts) do
    path = Keyword.fetch!(opts, :return_to)
    modal_opts = [id: :modal, return_to: path, component: component, opts: opts]
    live_component(socket, TlakauakWeb.ModalComponent, modal_opts)
  end

  def boolean_to_string(value) do
    if value do
      "SI"
    else
      "NO"
    end
  end
end
