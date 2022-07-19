defmodule Oportunidades.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      Oportunidades.Repo,
      # Start the Telemetry supervisor
      OportunidadesWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: Oportunidades.PubSub},
      # Start the Endpoint (http/https)
      OportunidadesWeb.Endpoint
      # Start a worker by calling: Oportunidades.Worker.start_link(arg)
      # {Oportunidades.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Oportunidades.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    OportunidadesWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
