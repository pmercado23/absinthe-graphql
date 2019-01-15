defmodule Reagent.Repo.Migrations.CreateReagents do
  use Ecto.Migration

  def change do
    create table(:reagent) do
      add :name, :string
      add :user_id, references(:users)
      add :item, :string
      timestamps()
    end
  end
end
