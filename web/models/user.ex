defmodule Test.User do
  use Test.Web, :model

  schema "users" do
    field :email, :string, null: false
    field :crypted_password, :string
    field :password, :string,virtual: true
    field :password_confirmation, :string, virtual: true
    field :name, :string, null: false
   # field :date, Ecto.DateTime, null: false
    
    has_many :contracts, Test.Test.Contract
      

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:email, :password, :name])
    |> validate_required([:email, :password, :name, :password_confirmation])
    |> unique_constraint(:email)
    |> validate_format(:email, ~r/@/)
    |> validate_length(:password, min: 8)
    |> validate_confirmation(:password)


  end
end
