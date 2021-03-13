defmodule Tlakauak.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      Tlakauak.Repo,
      # Start the Telemetry supervisor
      TlakauakWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: Tlakauak.PubSub},
      # Start the Endpoint (http/https)
      TlakauakWeb.Endpoint
      # Start a worker by calling: Tlakauak.Worker.start_link(arg)
      # {Tlakauak.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Tlakauak.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  def config_change(changed, _new, removed) do
    TlakauakWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
