defmodule SkillUp.Class do
  use Ecto.Schema
  import Ecto.Changeset

  schema "classes" do
    field :tittle, :string
    field :body, :string
    field :stream, Ecto.Enum, values: [:youtube, :vimeo]
    has_many :questions, SkillUp.Question
    has_many :results, SkillUp.Result
    belongs_to :course, SkillUp.Course

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(class, attrs) do
    class
    |> cast(attrs, [:tittle, :body, :stream])
    |> validate_required([:tittle, :body, :stream])
  end
end
