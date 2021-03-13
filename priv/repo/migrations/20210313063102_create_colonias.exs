defmodule Tlakauak.Repo.Migrations.CreateColonias do
  use Ecto.Migration

  def change do
    create table(:colonias) do
      add :clave, :string
      add :descripcion, :string
      add :inactivo, :boolean, default: false, null: false

      timestamps()
    end

    create unique_index(:colonias, [:clave])
  end
end
