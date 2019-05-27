defmodule Test.Repo.Migrations.AddVendorReferenceToCategory do
  use Ecto.Migration

  def change do
    alter table(:categories)do
      add :vendor_id, references(:vendors)
    end    
  end
end
