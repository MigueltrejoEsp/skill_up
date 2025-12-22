defmodule SkillUp.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      SkillUpWeb.Telemetry,
      SkillUp.Repo,
      {DNSCluster, query: Application.get_env(:skill_up, :dns_cluster_query) || :ignore},
      {Phoenix.PubSub, name: SkillUp.PubSub},
      # Start a worker by calling: SkillUp.Worker.start_link(arg)
      # {SkillUp.Worker, arg},
      # Start to serve requests, typically the last entry
      SkillUpWeb.Endpoint
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: SkillUp.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    SkillUpWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
