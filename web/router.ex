defmodule PaperRacer.Router do
  use Phoenix.Router

  pipeline :browser do
    plug :accepts, ~w(html)
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
  end

  pipeline :api do
    plug :accepts, ~w(json)
  end
  
  socket "/ws", PaperRacer do
    channel "race:*", RaceChannel
  end

  scope "/", PaperRacer do
    pipe_through :browser # Use the default browser stack

    get "/", RoomController, :index
    get "/:id", RoomController, :show
  end

  # Other scopes may use custom stacks.
  # scope "/api", PaperRacer do
  #   pipe_through :api
  # end
end
