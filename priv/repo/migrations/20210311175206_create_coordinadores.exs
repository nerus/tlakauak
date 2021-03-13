defmodule Tlakauak.Repo.Migrations.CreateCoordinadores do
  use Ecto.Migration

  def change do
    create table(:coordinadores) do
      add :clave, :string
      add :descripcion, :string

      timestamps()
    end

    create unique_index(:coordinadores, [:clave])
  end
end
