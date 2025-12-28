defmodule SkillUp.Repo.Migrations.CreateResults do
  use Ecto.Migration

  def change do
    create table(:results) do
      add :complete, :boolean, default: false, null: false
      add :passed, :boolean, default: false, null: false
      add :score, :integer
      add :user_id, references(:users, type: :id, on_delete: :delete_all)
      add :class_id, references(:classes, on_delete: :delete_all)
      add :question_id, references(:questions, on_delete: :delete_all)

      timestamps(type: :utc_datetime)
    end

    create index(:results, [:class_id])
    create index(:results, [:question_id])
    create index(:results, [:user_id])
  end
end
