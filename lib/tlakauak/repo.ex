defmodule Tlakauak.Repo do
  use Ecto.Repo,
    otp_app: :tlakauak,
    adapter: Ecto.Adapters.Postgres
end
