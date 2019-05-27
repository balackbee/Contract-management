defmodule Test.Repo.Migrations.CreateVendor do
  use Ecto.Migration

  def change do
    create table(:vendors) do
      add :name, :string

      timestamps()
    end

    create unique_index(:vendors, [:name])
  end
end
