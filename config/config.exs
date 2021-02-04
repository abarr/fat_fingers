# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

# Configures the endpoint
config :fat_fingers, FatFingersWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "7Ci/qCAySNo2vOFgaj2vZo8gvnPL6fnOe82j54eVwwFe3Sl94iVpYGC2fcypUwkH",
  render_errors: [view: FatFingersWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: FatFingers.PubSub,
  live_view: [signing_salt: "etwaAK9Y"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
