defmodule SkillUp.Course do
  use Ecto.Schema
  import Ecto.Changeset

  schema "courses" do
    field :tittle, :string
    field :body, :string
    has_many :classes, SkillUp.Class

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(course, attrs) do
    course
    |> cast(attrs, [:tittle, :body])
    |> validate_required([:tittle, :body])
  end
end
