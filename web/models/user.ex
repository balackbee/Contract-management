defmodule Test.User do
  use Test.Web, :model

  schema "users" do
    field :email, :string
    field :crypted_password, :string
    field :password, :string,virtual: true
    # field :confrm_password, :string
    field :name, :string

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:email, :password, :name])
    |> validate_required([:email, :password, :name])
    |> unique_constraint(:email)
  end
end
