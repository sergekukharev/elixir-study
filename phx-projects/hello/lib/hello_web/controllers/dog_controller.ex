defmodule HelloWeb.DogController do
  use HelloWeb, :controller
  require OpenTelemetry.Tracer

  def index(conn, _) do
    # Call `downstream` service
    OpenTelemetry.Tracer.with_span :call_downstream do
      middlewares = [
        Tesla.Middleware.JSON,
        Tesla.Middleware.OpenTelemetry
      ]

      client = Tesla.client(middlewares)

      {:ok, result} = Tesla.get(client, "http://localhost:4004/api/dogs")
      IO.puts("Called `downstream` service with #{result.status} response")
    end

    json(conn, [Hello.Repo.all(Hello.Dog)])
  end

  def create(conn, %{"name" => name, "age" => age}) do
    Hello.Repo.insert(%Hello.Dog{name: name, age: age})
    json(conn, %{status: "ok"})
  end
end

require Protocol
Protocol.derive(Jason.Encoder, Hello.Dog, only: [:name, :age])
