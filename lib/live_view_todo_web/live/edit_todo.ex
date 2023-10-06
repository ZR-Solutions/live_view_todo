defmodule LiveViewTodoWeb.EditTodo do
  use LiveViewTodoWeb, :live_view
  alias LiveViewTodo.Todos

  def mount(%{"id" => id}, _session, socket) do
    employee = Todos.get_employee!(id)
    changeset = LiveViewTodo.Todos.Employee.changeset(employee, %{})
    Todos.subscribe()
    {:ok, assign(socket, employee: employee, changeset: changeset, employee_id: id)}
  end

  def handle_event(
        "validate",
        %{"employee" => employee},
        %{assigns: %{employee: old_employee}} = socket
      ) do
    changeset = LiveViewTodo.Todos.Employee.changeset(old_employee, employee)
    {:noreply, assign(socket, changeset: changeset)}
  end

  def handle_event(
        "save",
        %{"employee" => employee},
        %{assigns: %{employee: old_employee}} = socket
      ) do
    case Todos.update_employee(old_employee, employee) do
      :ok ->
        {:noreply,
         socket
         |> push_redirect(to: Routes.index_path(socket, LiveViewTodoWeb.TodoLive))}

      _ ->
        {:noreply, socket}
    end
  end
end
