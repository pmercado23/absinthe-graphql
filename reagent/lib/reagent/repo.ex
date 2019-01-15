defmodule Reagent.Repo do
  use Ecto.Repo,
    otp_app: :reagent,
    adapter: Ecto.Adapters.Postgres
end
