defmodule Tlakauak.Abm_Colonia do
  @moduledoc """
  The Abm_Colonia context.
  """

  import Ecto.Query, warn: false
  alias Tlakauak.Repo

  alias Tlakauak.Abm_Colonia.Colonia

  @doc """
  Returns the list of colonias.

  ## Examples

      iex> list_colonias()
      [%Colonia{}, ...]

  """
  def list_colonias do
    Repo.all(Colonia)
  end

  @doc """
  Gets a single colonia.

  Raises `Ecto.NoResultsError` if the Colonia does not exist.

  ## Examples

      iex> get_colonia!(123)
      %Colonia{}

      iex> get_colonia!(456)
      ** (Ecto.NoResultsError)

  """
  def get_colonia!(id), do: Repo.get!(Colonia, id)

  @doc """
  Creates a colonia.

  ## Examples

      iex> create_colonia(%{field: value})
      {:ok, %Colonia{}}

      iex> create_colonia(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_colonia(attrs \\ %{}) do
    %Colonia{}
    |> Colonia.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a colonia.

  ## Examples

      iex> update_colonia(colonia, %{field: new_value})
      {:ok, %Colonia{}}

      iex> update_colonia(colonia, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_colonia(%Colonia{} = colonia, attrs) do
    colonia
    |> Colonia.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a colonia.

  ## Examples

      iex> delete_colonia(colonia)
      {:ok, %Colonia{}}

      iex> delete_colonia(colonia)
      {:error, %Ecto.Changeset{}}

  """
  def delete_colonia(%Colonia{} = colonia) do
    Repo.delete(colonia)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking colonia changes.

  ## Examples

      iex> change_colonia(colonia)
      %Ecto.Changeset{data: %Colonia{}}

  """
  def change_colonia(%Colonia{} = colonia, attrs \\ %{}) do
    Colonia.changeset(colonia, attrs)
  end
end
