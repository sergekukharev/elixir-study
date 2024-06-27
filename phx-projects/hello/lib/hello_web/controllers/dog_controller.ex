defmodule HelloWeb.DogController do
  use HelloWeb, :controller

  def index(conn, _) do
    json(conn, [Hello.Repo.all(Hello.Dog)])
  end

  def create(conn, %{"name" => name, "age" => age}) do
    Hello.Repo.insert(%Hello.Dog{name: name, age: age})
    json(conn, %{status: "ok"})
  end
end

require Protocol
Protocol.derive(Jason.Encoder, Hello.Dog, only: [:name, :age])
