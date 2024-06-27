defmodule HelloWeb.DogController do
  use HelloWeb, :controller

  def index(conn, _) do
    json(conn, [Hello.Repo.all(Hello.Dog)])
  end
end

require Protocol
Protocol.derive(Jason.Encoder, Hello.Dog, only: [:name, :age])
