defmodule ReagentWeb.UserResolver do
  alias Reagent.Users
  alias Reagent.Repo

  def all_users(_root, _args, _info) do
    users = Repo.all(Users)
    {:ok, users}
  end

  def create_user(_root, args, _info) do
    # TODO: add detailed error message handling later
    IO.inspect args
    case create_u(args) do
      {:ok, user} ->
        {:ok, user}
      _error ->
        {:error, "could not create User"}
    end
  end

  def create_u(attrs \\ %{}) do
    %Users{}
    |> Users.changeset(attrs)
    |> Repo.insert()
  end

  def find_user(_parent, %{id: id}, _resolution) do
    case Repo.get(Users, id) do
      nil ->
        {:error, "User ID #{id} not found"}
      user ->
        {:ok, user}
    end
  end

  def update_user(_root, args, _info) do
    # TODO: add detailed error message handling later
    %{id: id} = args
    case update_u(Repo.get(Users, id), args) do
      {:ok, user} ->
        {:ok, user}
      _error ->
        {:error, "could not update User"}
    end
  end

  def update_u(%Users{} = user, attrs) do
    user
    |> Users.changeset(attrs)
    |> Repo.update()
  end

  def delete_user(_root, args, _info) do
    # TODO: add detailed error message handling later
    %{id: id} = args
    case delete_u(Repo.get(Users, id)) do
      {:ok, user} ->
        {:ok, user}
      _error ->
        {:error, "could not delete User"}
    end
  end

  def delete_u(%Users{} = user) do
    Repo.delete(user)
  end

end