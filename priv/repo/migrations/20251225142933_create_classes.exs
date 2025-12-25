defmodule SkillUp.Repo.Migrations.CreateClasses do
  use Ecto.Migration

  def change do
    create table(:classes) do
      add :tittle, :string
      add :body, :string
      add :stream, :string
      add :course_id, references(:courses)

      timestamps(type: :utc_datetime)
    end

    create index(:classes, [:user_id])
  end
end
