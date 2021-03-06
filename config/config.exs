# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# Configures the endpoint
config :paper_racer, PaperRacer.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "nWRdgQs6UfjKzDcGAYZdpTrTlGxsQEe+f4pH8WGH8RLQeNKLVow/A+R6FCq2Wx5k",
  debug_errors: false,
  server: true

# Add Session Information
config :paper_racer, PaperRacer.Router,
  session: [store: :cookie,
            key: "nWRdgQs6UfjKzDcGAYZdpTrTlGxsQEe+f4pH8WGH8RLQeNKLVow/A+R6FCq2Wx5k"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
