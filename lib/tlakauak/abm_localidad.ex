defmodule Tlakauak.AbmLocalidad do
  @moduledoc """
  The AbmLocalidad context.
  """

  import Ecto.Query, warn: false
  alias Tlakauak.Repo

  alias Tlakauak.AbmLocalidad.Localidad

  @doc """
  Returns the list of localidades.

  ## Examples

      iex> list_localidades()
      [%Localidad{}, ...]

  """
  def list_localidades do
    Repo.all(Localidad)
  end

  @doc """
  Gets a single localidad.

  Raises `Ecto.NoResultsError` if the Localidad does not exist.

  ## Examples

      iex> get_localidad!(123)
      %Localidad{}

      iex> get_localidad!(456)
      ** (Ecto.NoResultsError)

  """
  def get_localidad!(id), do: Repo.get!(Localidad, id)

  @doc """
  Creates a localidad.

  ## Examples

      iex> create_localidad(%{field: value})
      {:ok, %Localidad{}}

      iex> create_localidad(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_localidad(attrs \\ %{}) do
    %Localidad{}
    |> Localidad.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a localidad.

  ## Examples

      iex> update_localidad(localidad, %{field: new_value})
      {:ok, %Localidad{}}

      iex> update_localidad(localidad, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_localidad(%Localidad{} = localidad, attrs) do
    localidad
    |> Localidad.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a localidad.

  ## Examples

      iex> delete_localidad(localidad)
      {:ok, %Localidad{}}

      iex> delete_localidad(localidad)
      {:error, %Ecto.Changeset{}}

  """
  def delete_localidad(%Localidad{} = localidad) do
    Repo.delete(localidad)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking localidad changes.

  ## Examples

      iex> change_localidad(localidad)
      %Ecto.Changeset{data: %Localidad{}}

  """
  def change_localidad(%Localidad{} = localidad, attrs \\ %{}) do
    Localidad.changeset(localidad, attrs)
  end
end
