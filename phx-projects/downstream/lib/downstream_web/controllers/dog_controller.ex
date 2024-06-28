defmodule DownstreamWeb.DogController do
  use DownstreamWeb, :controller

  def index(conn, _) do
    json(conn, %{test: true})
  end
end
