defmodule SkillUp.Repo do
  use Ecto.Repo,
    otp_app: :skill_up,
    adapter: Ecto.Adapters.Postgres
end
