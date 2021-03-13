defmodule Tlakauak.Repo.Migrations.AddInactivoToPromotor do
  use Ecto.Migration

  def change do
    alter table(:promotores) do
      add :inactivo, :boolean, default: false, null: false
    end
  end
end
