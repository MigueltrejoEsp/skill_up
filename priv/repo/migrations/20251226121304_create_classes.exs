defmodule SkillUp.Repo.Migrations.CreateClasses do
  use Ecto.Migration

  def change do
    create table(:classes) do
      add :tittle, :string
      add :body, :string
      add :stream, :string
      add :course_id, references(:courses, type: :id, on_delete: :delete_all)

      timestamps(type: :utc_datetime)
    end

    create index(:classes, [:course_id])
  end
end
