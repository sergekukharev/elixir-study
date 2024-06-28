defmodule DownstreamWeb.DogController do
  use DownstreamWeb, :controller

  def index(conn, _) do
    :timer.sleep(Enum.random(100..400))
    json(conn, %{test: true})
  end
end
