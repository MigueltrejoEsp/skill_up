defmodule SkillUp.Question do
  use Ecto.Schema
  import Ecto.Changeset

  schema "questions" do
    field :body, :string
    field :a, :string
    field :b, :string
    field :c, :string
    field :d, :string
    field :e, :string
    belongs_to :class, SkillUp.Class

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(question, attrs, user_scope) do
    question
    |> cast(attrs, [:body, :a, :b, :c, :d, :e])
    |> validate_required([:body, :a, :b, :c, :d, :e])
    |> put_change(:user_id, user_scope.user.id)
  end
end
