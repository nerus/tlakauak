defmodule Tlakauak.AbmPadron.Promovido do
  use Ecto.Schema
  import Ecto.Changeset
  alias  Tlakauak.Abm_Coordinador.Coordinador
  alias  Tlakauak.Abm_Promotor.Promotor
  alias  Tlakauak.Abm_Colonia.Colonia
  alias  Tlakauak.AbmLocalidad.Localidad

  schema "promovidos" do
    field :clave, :string
    # field :colonia_id, :integer
    # field :coordinador_id, :integer
    # field :localidad_id, :integer
    # field :promotor_id, :integer
    field :descripcion, :string
    field :direccion, :string
    field :inactivo, :boolean, default: false
    field :seccional, :string
    field :telefono, :string
    belongs_to :coordinador, Coordinador
    belongs_to :promotor, Promotor
    belongs_to :colonia, Colonia
    belongs_to :localidad, Localidad
    timestamps()
    field :session_id, :string
    field :user_id, :integer
  end

  @doc false
  def changeset(promovido, attrs) do
    promovido
    |> cast(attrs, [:clave, :descripcion, :direccion, :telefono, :seccional, :promotor_id, :colonia_id, :localidad_id, :inactivo, :user_id, :session_id])
    |> validate_required([:clave, :descripcion, :direccion, :telefono, :seccional, :promotor_id, :colonia_id, :localidad_id, :inactivo])
    |> unique_constraint(:clave)
  end
end
