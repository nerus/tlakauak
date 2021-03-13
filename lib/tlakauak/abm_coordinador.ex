defmodule Tlakauak.Abm_Coordinador do
  @moduledoc """
  The Abm_Coordinador context.
  """

  import Ecto.Query, warn: false
  alias Tlakauak.Repo

  alias Tlakauak.Abm_Coordinador.Coordinador

  @doc """
  Returns the list of coordinadores.

  ## Examples

      iex> list_coordinadores()
      [%Coordinador{}, ...]

  """
  def list_coordinadores do
    Repo.all(Coordinador)
  end

  @doc """
  Gets a single coordinador.

  Raises `Ecto.NoResultsError` if the Coordinador does not exist.

  ## Examples

      iex> get_coordinador!(123)
      %Coordinador{}

      iex> get_coordinador!(456)
      ** (Ecto.NoResultsError)

  """
  def get_coordinador!(id), do: Repo.get!(Coordinador, id)

  @doc """
  Creates a coordinador.

  ## Examples

      iex> create_coordinador(%{field: value})
      {:ok, %Coordinador{}}

      iex> create_coordinador(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_coordinador(attrs \\ %{}) do
    %Coordinador{}
    |> Coordinador.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a coordinador.

  ## Examples

      iex> update_coordinador(coordinador, %{field: new_value})
      {:ok, %Coordinador{}}

      iex> update_coordinador(coordinador, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_coordinador(%Coordinador{} = coordinador, attrs) do
    coordinador
    |> Coordinador.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a coordinador.

  ## Examples

      iex> delete_coordinador(coordinador)
      {:ok, %Coordinador{}}

      iex> delete_coordinador(coordinador)
      {:error, %Ecto.Changeset{}}

  """
  def delete_coordinador(%Coordinador{} = coordinador) do
    Repo.delete(coordinador)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking coordinador changes.

  ## Examples

      iex> change_coordinador(coordinador)
      %Ecto.Changeset{data: %Coordinador{}}

  """
  def change_coordinador(%Coordinador{} = coordinador, attrs \\ %{}) do
    Coordinador.changeset(coordinador, attrs)
  end
end
