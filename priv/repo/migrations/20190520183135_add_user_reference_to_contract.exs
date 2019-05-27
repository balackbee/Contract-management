defmodule Test.Repo.Migrations.AddUserReferenceToContract do
  use Ecto.Migration

  def change do
    alter table(:contracts) do
      add :user_id, references(:users)
    end

  end
end
