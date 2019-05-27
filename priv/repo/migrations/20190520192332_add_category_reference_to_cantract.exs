defmodule Test.Repo.Migrations.AddCategoryReferenceToCantract do
  use Ecto.Migration

  def change do
    alter table(:contracts)do
      add :category_id, references(:categories)
    end    

  end
end
