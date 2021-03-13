defmodule Tlakauak.Abm_Colonia.Colonia do
  use Ecto.Schema
  import Ecto.Changeset

  schema "colonias" do
    field :clave, :string
    field :descripcion, :string
    field :inactivo, :boolean, default: false

    timestamps()
  end

  @doc false
  def changeset(colonia, attrs) do
    colonia
    |> cast(attrs, [:clave, :descripcion, :inactivo])
    |> validate_required([:clave, :descripcion, :inactivo])
    |> unique_constraint(:clave)
  end
end
