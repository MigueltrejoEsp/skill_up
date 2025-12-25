defmodule SkillUp.Repo.Migrations.CreateResults do
  use Ecto.Migration

  def change do
    create table(:results) do
      add :complete, :boolean, default: false, null: false
      add :passed, :boolean, default: false, null: false
      add :user_id, references(:user, type: :id, on_delete: :delete_all)
      add :question_id, references(:questions)

      timestamps(type: :utc_datetime)
    end

    create index(:results, [:user_id])
  end
end
