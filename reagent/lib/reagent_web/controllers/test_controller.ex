defmodule ReagentWeb.TestController do
  use ReagentWeb, :controller
  require Logger

  def _status(conn, _params) do
    data = %{msg: "Reagent MiddleWare -- OK"}
    json(conn, data)
  end

  def index(conn, _params) do
    #client = CQEx.Client.new!
    #all_users = client |> CQEx.Query.call!("SELECT * FROM users;") |> Enum.to_list
    data = %{users: []}
    json(conn, data)
  end

end
