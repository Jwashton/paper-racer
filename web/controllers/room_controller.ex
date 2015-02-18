defmodule PaperRacer.RoomController do
  use Phoenix.Controller
  
  plug :action
  
  def index(conn, _params) do
    conn
    |> assign(:current_user, current_user(conn))
    |> assign(:logged_in, logged_in?(conn))
    |> render("index.html")
  end
  
  def show(conn, %{"id" => room_id}) do
    conn
    |> put_layout(false)
    |> assign(:current_user, current_user(conn))
    |> render "show.html", id: room_id
  end
  
  defp logged_in?(conn) do
    get_session(conn, :username) != nil
  end
  
  defp current_user(conn) do
    get_session(conn, :username) || "Anon"
  end
end
