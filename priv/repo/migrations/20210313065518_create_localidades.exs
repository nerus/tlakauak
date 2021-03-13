defmodule Tlakauak.Repo.Migrations.CreateLocalidades do
  use Ecto.Migration

  def change do
    create table(:localidades) do
      add :clave, :string
      add :descripcion, :string
      add :inactivo, :boolean, default: false, null: false

      timestamps()
    end

    create unique_index(:localidades, [:clave])
  end
end
