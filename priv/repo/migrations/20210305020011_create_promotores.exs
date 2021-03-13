defmodule Tlakauak.Repo.Migrations.CreatePromotores do
  use Ecto.Migration

  def change do
    create table(:promotores) do
      add :clave, :string
      add :descripcion, :string

      timestamps()
    end

    create unique_index(:promotores, [:clave])
  end
end
