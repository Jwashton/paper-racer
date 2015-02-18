defmodule PaperRacer.SessionController do
  use Phoenix.Controller
  
  plug :action
  
  def new(conn, _params) do
    render conn, "login.html"
  end
  
  def create(conn, params) do
    text conn, params["username"]
  end
end
