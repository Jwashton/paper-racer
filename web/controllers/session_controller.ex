defmodule PaperRacer.SessionController do
  use Phoenix.Controller
  
  plug :action
  
  def new(conn, _params) do
    render conn, "login.html"
  end
  
  def create(conn, params) do
    conn
    |> put_session(:username, params["username"])
    |> redirect to: "/"
  end
end
