defmodule LiveViewTodo.Todos.Employee do
  use Ecto.Schema
  import Ecto.Changeset

  schema "employees" do
    field :location, :string
    field :name, :string

    timestamps()
  end

  @doc false
  def changeset(employee, attrs) do
    employee
    |> cast(attrs, [:name, :location])
    |> validate_required([:name, :location])
  end
end
