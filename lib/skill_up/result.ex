defmodule SkillUp.Result do
  use Ecto.Schema
  import Ecto.Changeset

  schema "results" do
    field :complete, :boolean, default: false
    field :passed, :boolean, default: false
    field :score, :integer

    belongs_to :class, SkillUp.Class
    belongs_to :question, SkillUp.Question
    belongs_to :user, SkillUp.Accounts.User

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(result, attrs, user_scope) do
    result
    |> cast(attrs, [:complete, :passed])
    |> validate_required([:complete, :passed])
    |> put_change(:user_id, user_scope.user.id)
  end
end
