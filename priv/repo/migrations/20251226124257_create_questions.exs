defmodule SkillUp.Repo.Migrations.CreateQuestions do
  use Ecto.Migration

  def change do
    create table(:questions) do
      add :body, :string
      add :a, :string
      add :b, :string
      add :c, :string
      add :d, :string
      add :e, :string
      add :class_id, references(:classes)

      timestamps(type: :utc_datetime)
    end

    create index(:questions, :class_id)
  end
end
