defmodule SkillUp.Answer do
  use Ecto.Schema
  import Ecto.Changeset

  schema "answers" do
    field :body, :string
    field :correct, :boolean, default: false
    field :user_id, :id
    belongs_to :question, SkillUp.Question

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(answer, attrs, user_scope) do
    answer
    |> cast(attrs, [:body, :correct])
    |> validate_required([:body, :correct])
    |> put_change(:user_id, user_scope.user.id)
  end
end
