defmodule Test.Repo.Migrations.AddVendorsReferenceToContract do
  use Ecto.Migration

  def change do
    alter table(:contracts)do
      add :vendor_id, references(:vendors)
    end    

  end
end
