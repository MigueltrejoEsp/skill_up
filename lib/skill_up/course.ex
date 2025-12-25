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
  def changeset(course, attrs, user_scope) do
    course
    |> cast(attrs, [:tittle, :body])
    |> validate_required([:tittle, :body])
    |> put_change(:user_id, user_scope.user.id)
  end
end
