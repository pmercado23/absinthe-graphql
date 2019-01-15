defmodule ReagentWeb.UserController do
  use ReagentWeb, :controller
  require Logger


  def index(conn, _params)do
    data = %{}#Repo.all(User) |> Enum.into(%{})
    IO.inspect data

    json(conn, data)
  end




end
