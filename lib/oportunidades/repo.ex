defmodule Oportunidades.Repo do
  use Ecto.Repo,
    otp_app: :oportunidades,
    adapter: Ecto.Adapters.Postgres
end
