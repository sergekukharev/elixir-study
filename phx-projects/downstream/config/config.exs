# This file is responsible for configuring your application
# and its dependencies with the aid of the Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
import Config

config :downstream,
  generators: [timestamp_type: :utc_datetime]

# Configures the endpoint
config :downstream, DownstreamWeb.Endpoint,
  url: [host: "localhost"],
  adapter: Phoenix.Endpoint.Cowboy2Adapter,
  render_errors: [
    formats: [json: DownstreamWeb.ErrorJSON],
    layout: false
  ],
  pubsub_server: Downstream.PubSub,
  live_view: [signing_salt: "zWJ4YJQ1"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

config :opentelemetry,
  resource: %{
    service: %{name: "downstream"}
  },
  text_map_propagators: [:baggage, :trace_context]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{config_env()}.exs"
