defmodule Tlakauak.Repo.Migrations.CreatePromovidos do
  use Ecto.Migration

  def change do
    create table(:promovidos) do
      add :clave, :string
      add :descripcion, :string
      add :direccion, :string
      add :telefono, :string
      add :seccional, :string
      add :coordinador_id, references(:coordinadores, on_delete: :nothing) 
      add :promotor_id, references(:promotores, on_delete: :nothing) 
      add :colonia_id, references(:colonias, on_delete: :nothing) 
      add :localidad_id, references(:localidades, on_delete: :nothing) 
      add :inactivo, :boolean, default: false, null: false

      timestamps()
    end

    create unique_index(:promovidos, [:clave])
  end
end
