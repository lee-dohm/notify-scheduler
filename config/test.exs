import Config

# Configure your database
#
# The MIX_TEST_PARTITION environment variable can be used
# to provide built-in test partitioning in CI environment.
# Run `mix help test` for more information.
config :notify_scheduler, NotifyScheduler.Repo,
  username: "postgres",
  password: "postgres",
  hostname: "localhost",
  database: "notify_scheduler_test#{System.get_env("MIX_TEST_PARTITION")}",
  pool: Ecto.Adapters.SQL.Sandbox,
  pool_size: 10

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :notify_scheduler, NotifySchedulerWeb.Endpoint,
  http: [ip: {127, 0, 0, 1}, port: 4002],
  secret_key_base: "T6u6O5Q0Xi69BXhhcfvrX5z2dLQK7oDF5B1Raa98mj/5otR+tisot7dWWfQPD4ac",
  server: false

# In test we don't send emails.
config :notify_scheduler, NotifyScheduler.Mailer, adapter: Swoosh.Adapters.Test

# Print only warnings and errors during test
config :logger, level: :warn

# Initialize plugs at runtime for faster test compilation
config :phoenix, :plug_init_mode, :runtime
