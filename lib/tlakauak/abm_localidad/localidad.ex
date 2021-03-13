defmodule Tlakauak.AbmLocalidad.Localidad do
  use Ecto.Schema
  import Ecto.Changeset

  schema "localidades" do
    field :clave, :string
    field :descripcion, :string
    field :inactivo, :boolean, default: false

    timestamps()
  end

  @doc false
  def changeset(localidad, attrs) do
    localidad
    |> cast(attrs, [:clave, :descripcion, :inactivo])
    |> validate_required([:clave, :descripcion, :inactivo])
    |> unique_constraint(:clave)
  end
end
