defmodule Tlakauak.AbmPadron do
  @moduledoc """
  The AbmPadron context.
  """

  import Ecto.Query, warn: false
  alias Tlakauak.Repo

  alias Tlakauak.AbmPadron.Promovido

  @doc """
  Returns the list of promovidos.

  ## Examples

      iex> list_promovidos()
      [%Promovido{}, ...]

  """
  def list_promovidos do
    Promovido
    |> preload(:promotor)
    |> preload(:colonia)
    |> preload(:localidad)
    |> Repo.all()
    
  end

  @doc """
  Gets a single promovido.

  Raises `Ecto.NoResultsError` if the Promovido does not exist.

  ## Examples

      iex> get_promovido!(123)
      %Promovido{}

      iex> get_promovido!(456)
      ** (Ecto.NoResultsError)

  """
  def get_promovido!(id), do: Repo.get!(Promovido, id)

  @doc """
  Creates a promovido.

  ## Examples

      iex> create_promovido(%{field: value})
      {:ok, %Promovido{}}

      iex> create_promovido(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_promovido(attrs \\ %{}) do
    %Promovido{}
    |> Promovido.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a promovido.

  ## Examples

      iex> update_promovido(promovido, %{field: new_value})
      {:ok, %Promovido{}}

      iex> update_promovido(promovido, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_promovido(%Promovido{} = promovido, attrs) do
    promovido
    |> Promovido.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a promovido.

  ## Examples

      iex> delete_promovido(promovido)
      {:ok, %Promovido{}}

      iex> delete_promovido(promovido)
      {:error, %Ecto.Changeset{}}

  """
  def delete_promovido(%Promovido{} = promovido) do
    Repo.delete(promovido)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking promovido changes.

  ## Examples

      iex> change_promovido(promovido)
      %Ecto.Changeset{data: %Promovido{}}

  """
  def change_promovido(%Promovido{} = promovido, attrs \\ %{}) do
    Promovido.changeset(promovido, attrs)
  end
end
