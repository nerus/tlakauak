# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :tlakauak,
  ecto_repos: [Tlakauak.Repo]

# Configures the endpoint
config :tlakauak, TlakauakWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "ngr3EBEwI2smd4EqLcKAeuNYWLLCtpLoA+Xxog42138uhxHqDgwu7GA1wF4y5ZT7",
  render_errors: [view: TlakauakWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: Tlakauak.PubSub,
  live_view: [signing_salt: "/gtznDzu"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
