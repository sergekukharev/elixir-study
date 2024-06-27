defmodule Hello.Dog do
  use Ecto.Schema
  import Ecto.Changeset

  schema "dogs" do
    field :name, :string
    field :age, :integer

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(dog, attrs) do
    dog
    |> cast(attrs, [:name, :age])
    |> validate_required([:name, :age])
  end
end
