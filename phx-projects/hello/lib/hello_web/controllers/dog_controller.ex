defmodule HelloWeb.DogController do
  use HelloWeb, :controller

  def index(conn, _) do
    json(conn, [%{id: 123, name: "Charlie"}])
  end
end
