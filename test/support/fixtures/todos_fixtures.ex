defmodule LiveViewTodo.TodosFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `LiveViewTodo.Todos` context.
  """

  @doc """
  Generate a employee.
  """
  def employee_fixture(attrs \\ %{}) do
    {:ok, employee} =
      attrs
      |> Enum.into(%{
        location: "some location",
        name: "some name"
      })
      |> LiveViewTodo.Todos.create_employee()

    employee
  end
end
