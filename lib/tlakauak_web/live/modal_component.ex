defmodule TlakauakWeb.ModalComponent do
  use TlakauakWeb, :live_component

  @impl true
  def render(assigns) do
    #  assigns |> IO.inspect(label: "ModalComponent.assigns")
    ~L"""
    <div id="<%= @id %>" 
      class="modal-dialog modal-dialog-centered modal-dialog-scrollable" 
      tabindex="-1"
      phx-capture-click="close"
      phx-window-keydown="close"
      phx-key="escape"
      phx-target="#<%= @id %>"
      phx-page-loading>

      
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title"><%= @title %></h5>
          <%= live_patch raw("&times;"), to: @return_to %>
        </div>
          <%= live_component @socket, @component, @opts %>
      </div>

    </div>
    """
  end
  # <div class="modal-dialog modal-dialog-scrollable">
  # </div>
  # <!-- <%=# if @current_user do %> -->
  #   <!-- <%# else %> -->
  #   <!-- <%=# live_component @socket, @component, @opts %> -->
  #   <!-- <%# end %>  -->

  # <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
  # <div class="phx-modal-content">
  #     <%= live_patch raw("&times;"), to: @return_to, class: "phx-modal-close" %>
  #     <%= live_component @socket, @component, @opts %>
  #   </div>
  # <div class="modal-body">
  # </div>

  @impl true
  def handle_event("close", _, socket) do
    {:noreply, push_patch(socket, to: socket.assigns.return_to)}
  end
end
