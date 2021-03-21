defmodule Tlakauak.Abm_Coordinador.Coordinador do
  use Ecto.Schema
  import Ecto.Changeset
  alias Tlakauak.Abm_Promotor.Promotor

  schema "coordinadores" do
    field :clave, :string
    field :descripcion, :string
    field :inactivo, :boolean, default: false
    field :telefono, :string
    timestamps()
    has_many :promotores, Promotor
    field :session_id, :string
    field :user_id, :integer
  end

  @doc false
  def changeset(coordinador, attrs) do
    coordinador
    |> cast(attrs, [:clave, :descripcion, :telefono, :inactivo, :session_id, :user_id])
    |> validate_required([:clave, :descripcion, :inactivo])
    |> unique_constraint(:clave)
  end
end
