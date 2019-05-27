defmodule Test.Test.Contract do
  use Ecto.Schema
  import Ecto.Changeset

  schema "contracts" do
    field :cost, :integer
    field :ends_on, :date
    belongs_to :user, Test.User
    belongs_to :vendor, Test.Vendor
    belongs_to :category, Test.Category
    
    timestamps()  
  end

    @doc false
    def changeset(contract, attrs) do
      contract
      |> cast(attrs, [:cost, :ends_on, :vendor_id])
      |> validate_required([:cost, :ends_on])
     # |> validate_change(:date, &must_be_in_future/2)
    end

   # defp must_be_in_future(_, value) do{
    # Ecto.DateTime.compare(value, Ecto.DateTime.utc)
     # |> get_error
     #}
    #end

    #defp get_error(comparison) do{
     # if comparison==:lt do 
      #  [date: "cannot be in past"]
      #end
      #}
    #end
    #defp get_error(_), do: []
end
