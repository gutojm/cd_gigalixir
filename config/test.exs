import Config

# Configure your database
#
# The MIX_TEST_PARTITION environment variable can be used
# to provide built-in test partitioning in CI environment.
# Run `mix help test` for more information.
config :cd_gigalixir, CdGigalixir.Repo,
  username: "postgres",
  password: "postgres",
  hostname: "localhost",
  database: "cd_gigalixir_test#{System.get_env("MIX_TEST_PARTITION")}",
  pool: Ecto.Adapters.SQL.Sandbox,
  pool_size: 10

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :cd_gigalixir, CdGigalixirWeb.Endpoint,
  http: [ip: {127, 0, 0, 1}, port: 4002],
  secret_key_base: "R5iEfyTDDLwAwR2CIRIxADGk87M1vY08T9HxBfdRxsdUXdncW66d74LX9Q2X2Bq8",
  server: false

# In test we don't send emails.
config :cd_gigalixir, CdGigalixir.Mailer, adapter: Swoosh.Adapters.Test

# Print only warnings and errors during test
config :logger, level: :warn

# Initialize plugs at runtime for faster test compilation
config :phoenix, :plug_init_mode, :runtime
