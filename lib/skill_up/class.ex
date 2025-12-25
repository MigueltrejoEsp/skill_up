defmodule SkillUp.Class do
  use Ecto.Schema
  import Ecto.Changeset

  schema "classes" do
    field :tittle, :string
    field :body, :string
    field :stream, Ecto.Enum, values: [:youtube, :vimeo]
    has_many :questions, SkillUp.Question
    belongs_to :course, SkillUp.Course

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(class, attrs, user_scope) do
    class
    |> cast(attrs, [:tittle, :body, :stream])
    |> validate_required([:tittle, :body, :stream])
    |> put_change(:user_id, user_scope.user.id)
  end
end
