defmodule ReagentWeb.Router do
  use ReagentWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/" do
    pipe_through :api
    #get "/_status", TestController, :_status
    #get "/", TestController, :index
    #get "/users", UserController, :index
    forward "/graph", Absinthe.Plug, schema: ReagentWeb.Schema

    forward "/graphiql", Absinthe.Plug.GraphiQL,
            schema: ReagentWeb.Schema,
            interface: :simple,
            context: %{pubsub: ReagentWeb.Endpoint}

  end
end
