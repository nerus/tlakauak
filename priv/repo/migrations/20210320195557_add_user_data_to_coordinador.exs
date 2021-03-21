defmodule Tlakauak.Repo.Migrations.AddUserDataToCoordinador do
  use Ecto.Migration

  def change do
    alter table(:coordinadores) do
      add :telefono, :string
      add :session_id, :string
      add :user_id, references(:users, on_delete: :nothing) 
    end
  end
end
