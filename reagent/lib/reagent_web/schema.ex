defmodule ReagentWeb.Schema do
  use Absinthe.Schema
  alias ReagentWeb.UserResolver

  object :users do
    field :id, :string
    field :first_name, :string
    field :last_name, :string
    field :email, :string
    field :provider, :string
    field :token, :string
  end

  query do
    field :all_users, non_null(list_of(non_null(:users))) do
      resolve &UserResolver.all_users/3
    end

    field :find_user, :users do
      arg :id, non_null(:id)
      resolve &UserResolver.find_user/3
    end

  end

  mutation do
    field :create_user, :users do
      arg :first_name, non_null(:string)
      arg :last_name, non_null(:string)
      arg :email, non_null(:string)
      arg :provider, non_null(:string)
      arg :token, non_null(:string)

      resolve &UserResolver.create_user/3
    end

    field :update_user, :users do
      arg :id, non_null(:id)
      arg :first_name, :string
      arg :last_name, :string
      arg :email, :string
      arg :provider, :string
      arg :token, :string
      resolve &UserResolver.update_user/3
    end

    field :delete_user, :users do
      arg :id, non_null(:id)
      resolve &UserResolver.delete_user/3
    end

  end

end