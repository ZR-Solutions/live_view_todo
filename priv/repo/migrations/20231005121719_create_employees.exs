defmodule LiveViewTodo.Repo.Migrations.CreateEmployees do
  use Ecto.Migration

  def change do
    create table(:employees) do
      add :name, :string
      add :location, :string

      timestamps()
    end
  end
end
