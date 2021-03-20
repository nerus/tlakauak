defmodule Tlakauak.Repo.Migrations.AddUserDataToPromovido do
  use Ecto.Migration

  def change do
    alter table(:promovidos) do
      add :session_id, :string
      add :user_id, references(:users, on_delete: :nothing) 
    end
  end
end
