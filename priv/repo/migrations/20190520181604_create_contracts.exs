defmodule Test.Repo.Migrations.CreateContracts do
  use Ecto.Migration
 

  def change do
    create table(:contracts) do
      add :cost, :integer
      add :ends_on, :date 
      timestamps()
    end

  end
end
