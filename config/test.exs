use Mix.Config

# Configure your database
config :ecommerceshop, Ecommerceshop.Repo,
  username: "postgres",
  password: "postgres",
  database: "ecommerceshop_test",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :ecommerceshop, EcommerceshopWeb.Endpoint,
  http: [port: 4002],
  server: false

config :ecommerceshop, :user_salt, "+Btud6OY3a5viN6RbDXBljp5DnP0py5piXRfaxsePiL6Bxj+JWEVORBd2bmRdOWv"
# Print only warnings and errors during test
config :logger, level: :warn
