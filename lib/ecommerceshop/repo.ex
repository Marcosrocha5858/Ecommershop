defmodule Ecommerceshop.Repo do
  use Ecto.Repo,
    otp_app: :ecommerceshop,
    adapter: Ecto.Adapters.Postgres
end
