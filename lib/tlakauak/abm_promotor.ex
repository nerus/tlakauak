defmodule Tlakauak.Abm_Promotor do
  @moduledoc """
  The Abm_Promotor context.
  """

  import Ecto.Query, warn: false
  alias Tlakauak.Repo

  alias Tlakauak.Abm_Promotor.Promotor

  @doc """
  Returns the list of promotores.

  ## Examples

      iex> list_promotores()
      [%Promotor{}, ...]

  """
  def list_promotores do
    Promotor
    |> preload(:coordinador)
    |> Repo.all()
  end

  @doc """
  Gets a single promotor.

  Raises `Ecto.NoResultsError` if the Promotor does not exist.

  ## Examples

      iex> get_promotor!(123)
      %Promotor{}

      iex> get_promotor!(456)
      ** (Ecto.NoResultsError)

  """
  def get_promotor!(id) do 
    Promotor
    |> preload(:coordinador) 
    |> Repo.get!(id)
  end

  @doc """
  Creates a promotor.

  ## Examples

      iex> create_promotor(%{field: value})
      {:ok, %Promotor{}}

      iex> create_promotor(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_promotor(attrs \\ %{}) do
    %Promotor{}
    |> Promotor.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a promotor.

  ## Examples

      iex> update_promotor(promotor, %{field: new_value})
      {:ok, %Promotor{}}

      iex> update_promotor(promotor, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_promotor(%Promotor{} = promotor, attrs) do
    promotor
    |> Promotor.changeset(attrs)
    |> IO.inspect(label: "update_promotor")
    |> Repo.update()
  end

  @doc """
  Deletes a promotor.

  ## Examples

      iex> delete_promotor(promotor)
      {:ok, %Promotor{}}

      iex> delete_promotor(promotor)
      {:error, %Ecto.Changeset{}}

  """
  def delete_promotor(%Promotor{} = promotor) do
    Repo.delete(promotor)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking promotor changes.

  ## Examples

      iex> change_promotor(promotor)
      %Ecto.Changeset{data: %Promotor{}}

  """
  def change_promotor(%Promotor{} = promotor, attrs \\ %{}) do
    Promotor.changeset(promotor, attrs)
  end
end
