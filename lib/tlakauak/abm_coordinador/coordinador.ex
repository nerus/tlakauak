defmodule Tlakauak.Abm_Coordinador.Coordinador do
  use Ecto.Schema
  import Ecto.Changeset
  alias Tlakauak.Abm_Promotor.Promotor

  schema "coordinadores" do
    field :clave, :string
    field :descripcion, :string
    field :inactivo, :boolean, default: false
    timestamps()
    has_many :promotores, Promotor
  end

  @doc false
  def changeset(coordinador, attrs) do
    coordinador
    |> cast(attrs, [:clave, :descripcion, :inactivo])
    |> validate_required([:clave, :descripcion, :inactivo])
    |> unique_constraint(:clave)
  end
end
