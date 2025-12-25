defmodule SkillUp.Repo.Migrations.CreateAnswers do
  use Ecto.Migration

  def change do
    create table(:answers) do
      add :body, :string
      add :correct, :boolean, default: false, null: false
      add :user_id, references(:users, type: :id, on_delete: :delete_all)
      add :question_id, references(:questions)

      timestamps(type: :utc_datetime)
    end

    create index(:answers, [:user_id])
  end
end
