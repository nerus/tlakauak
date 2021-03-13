defmodule Tlakauak.Repo.Migrations.AddCoordinadorToPromotor do
  use Ecto.Migration

  def change do
    alter table(:promotores) do
      add :coordinador_id, references(:coordinadores, on_delete: :nothing) 
    end
      #create index(:coordinadores, [:coordinador_id])
  end
end
