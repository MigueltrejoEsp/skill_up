defmodule SkillUp.Repo.Migrations.CreateCourses do
  use Ecto.Migration

  def change do
    create table(:courses) do
      add :tittle, :string
      add :body, :string
      add :class_id, references(:classes)

      timestamps(type: :utc_datetime)
    end

    create index(:courses, [:user_id])
  end
end
