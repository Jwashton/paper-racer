defmodule PaperRacer.RoomController do
  use Phoenix.Controller
  
  plug :action
  
  def index(conn, _params) do
    render conn, "index.html"
  end
  
  def show(conn, %{"id" => room_id}) do
    render conn, "show.html", id: room_id
  end
end
