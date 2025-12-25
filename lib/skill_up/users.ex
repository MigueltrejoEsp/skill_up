defmodule SkillUp.User do
  use Ecto.Schema
  import Ecto.Changeset

  schema "user" do
    field :name, :string
    field :users_id, :id
    has_many :results, SkillUp.Result

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(users, attrs, user_scope) do
    users
    |> cast(attrs, [:name])
    |> validate_required([:name])
    |> put_change(:user_id, user_scope.user.id)
  end
end
