defmodule Tlakauak.Repo.Migrations.AddUserDataToPromotor do
  use Ecto.Migration

  def change do
    alter table(:promotores) do
      add :telefono, :string
      add :session_id, :string
      add :user_id, references(:users, on_delete: :nothing) 
    end
  end
end
