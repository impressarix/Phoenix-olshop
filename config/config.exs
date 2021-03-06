# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

config :phoenix_amazon,
  namespace: Amazon,
  ecto_repos: [Amazon.Repo]

# Configures the endpoint
config :phoenix_amazon, Amazon.Endpoint,
  url: [host: "localhost"],
  root: Path.dirname(__DIR__),
  secret_key_base: "hWbd3QwLuaWKwJY5qYOKLGSBboxjnW46c4TzBAa+cMODz26RokgHQIJo6Nej3DGr",
  render_errors: [accepts: ~w(html json)],
  pubsub: [name: Amazon.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Configure phoenix generators
config :phoenix, :generators,
  migration: true,
  binary_id: false

# Configure guardian
config :guardian, Guardian,
  issuer: "suman.io",
  allowed_algos: ["HS512"],
  ttl: {2, :days},
  verify_issuer: true,
  serializer: Amazon.GuardianSerializer

# Start Hound for PhantomJs
config :hound, driver: "chrome_driver"

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
