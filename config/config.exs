# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :ecommerceshop,
  ecto_repos: [Ecommerceshop.Repo]

# Configures the endpoint
config :ecommerceshop, EcommerceshopWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "dpffhxZpBL68VOJ9S7sgsNbKB8ChaUKxC8hAbBly5Yote0QG5OdeKVmMXbqZRi4t",
  render_errors: [view: EcommerceshopWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Ecommerceshop.PubSub, adapter: Phoenix.PubSub.PG2],
  live_view: [signing_salt: "BmSWd6GC"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
