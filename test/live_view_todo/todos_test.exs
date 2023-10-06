defmodule LiveViewTodo.TodosTest do
  use LiveViewTodo.DataCase

  alias LiveViewTodo.Todos

  describe "employees" do
    alias LiveViewTodo.Todos.Employee

    import LiveViewTodo.TodosFixtures

    @invalid_attrs %{location: nil, name: nil}

    test "list_employees/0 returns all employees" do
      employee = employee_fixture()
      assert Todos.list_employees() == [employee]
    end

    test "get_employee!/1 returns the employee with given id" do
      employee = employee_fixture()
      assert Todos.get_employee!(employee.id) == employee
    end

    test "create_employee/1 with valid data creates a employee" do
      valid_attrs = %{location: "some location", name: "some name"}

      assert {:ok, %Employee{} = employee} = Todos.create_employee(valid_attrs)
      assert employee.location == "some location"
      assert employee.name == "some name"
    end

    test "create_employee/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Todos.create_employee(@invalid_attrs)
    end

    test "update_employee/2 with valid data updates the employee" do
      employee = employee_fixture()
      update_attrs = %{location: "some updated location", name: "some updated name"}

      assert {:ok, %Employee{} = employee} = Todos.update_employee(employee, update_attrs)
      assert employee.location == "some updated location"
      assert employee.name == "some updated name"
    end

    test "update_employee/2 with invalid data returns error changeset" do
      employee = employee_fixture()
      assert {:error, %Ecto.Changeset{}} = Todos.update_employee(employee, @invalid_attrs)
      assert employee == Todos.get_employee!(employee.id)
    end

    test "delete_employee/1 deletes the employee" do
      employee = employee_fixture()
      assert {:ok, %Employee{}} = Todos.delete_employee(employee)
      assert_raise Ecto.NoResultsError, fn -> Todos.get_employee!(employee.id) end
    end

    test "change_employee/1 returns a employee changeset" do
      employee = employee_fixture()
      assert %Ecto.Changeset{} = Todos.change_employee(employee)
    end
  end
end
