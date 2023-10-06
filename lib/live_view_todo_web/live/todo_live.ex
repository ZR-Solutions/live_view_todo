defmodule LiveViewTodoWeb.TodoLive do
  use LiveViewTodoWeb, :live_view
  alias LiveViewTodo.Todos
  import Phoenix.HTML.Form
  # import Phoenix.LiveView.Helpers



  def mount(_params, _session, socket) do
    Todos.subscribe()
    {:ok, fetch(socket)}
  end

  def handle_event("add", %{"employee" => employee}, socket) do
    Todos.create_employee(employee)

    {:noreply, socket}
    # {:noreply, fetch(socket)}

  end

  def handle_event("toggle_delete", %{"id" => id}, socket) do
    employee = Todos.get_employee!(id)
    Todos.delete_employee(employee)

    # socket = assign(socket, employees: Todos.list_employees())
    {:noreply, fetch(socket)}
  end

  def handle_event("toggle_update", %{"id" => id}, socket) do
    Todos.get_employee!(id) |> IO.inspect()
    # Todos.update_employee(employee, params)
    socket = assign(socket, editable?: true)
    {:noreply, socket}

  end


  def handle_info({Todos, [:employee | _], _}, socket) do
    {:noreply, fetch(socket)}


  end

  defp fetch(socket) do
    assign(socket, employees: Todos.list_employees(), editable?: false)
  end

  # def render(assigns) do
  #   ~L"Rendering LiveView"
  # end
end
