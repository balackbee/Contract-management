defmodule Test.Category do
  use Test.Web, :model

  schema "categories" do
    field :name, :string
    belongs_to :vendor, Test.Vendor
    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:name])
    |> validate_required([:name])
  end
end
