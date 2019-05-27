defmodule Test.Vendor do
  use Test.Web, :model

  schema "vendors" do
    field :name, :string
    has_many :categories, Test.Category
    has_many :contracts, Test.Test.Contract
    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:name])
    |> validate_required([:name])
    |> unique_constraint(:name)
  end
end
