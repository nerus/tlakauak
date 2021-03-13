defmodule Tlakauak.Abm_Promotor.Promotor do
  use Ecto.Schema
  import Ecto.Changeset
  alias  Tlakauak.Abm_Coordinador.Coordinador

  schema "promotores" do
    field :clave, :string
    field :descripcion, :string
    field :inactivo, :boolean, default: false
    timestamps()
    belongs_to :coordinador, Coordinador
  end

  @doc false
  def changeset(promotor, attrs) do
    promotor
    |> cast(attrs, [:clave, :descripcion, :coordinador_id, :inactivo])
    |> validate_required([:clave, :descripcion, :coordinador_id, :inactivo])
    |> unique_constraint(:clave)
  end
end


# mix phx.gen.live AbmPadron Credencial credenciales clave:string:unique descripcion:string direccion:string, telefono:string seccional:string
# mix phx.gen.live AbmColonia Colonia colonias clave:string:unique descripcion:string inactivo:boolean
# mix phx.gen.live AbmLocalidad Localidad localidades clave:string:unique descripcion:string inactivo:boolean
# mix phx.gen.live AbmPadron Promovido promovidos clave:string:unique descripcion:string direccion:string, telefono:string seccional:string coordinador_id:integer promotor_id:integer colonia_id:integer localidad_id:integer inactivo:boolean 