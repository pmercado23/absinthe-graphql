defmodule Reagent.Users do
  use Ecto.Schema
  import Ecto.Changeset
  import Ecto.Query

  schema "users" do
    field :first_name, :string
    field :last_name, :string
    field :email, :string
    field :provider, :string
    field :token, :string
    timestamps()
  end

  def changeset(struct, params \\ %{})do
    struct
    |> cast(params, [:first_name, :last_name ,:email, :provider, :token])
    |> validate_required([:email, :provider, :token])
  end

end