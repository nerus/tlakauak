defmodule Tlakauak.Repo.Migrations.AddInactivoToCoordinador do
  use Ecto.Migration

  def change do
    alter table(:coordinadores) do
      add :inactivo, :boolean, default: false, null: false
    end
  end
end
