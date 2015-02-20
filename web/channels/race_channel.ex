defmodule PaperRacer.RaceChannel do
  use Phoenix.Channel
  require Logger
  
  def join("race:" <> _race_id, message, socket) do
    # Log the event
    Logger.debug "JOIN #{socket.topic}"
    
    # Tell the user that he joined successfully
    reply socket, "join", %{status: "connected"}
    
    # Tell everyone else that a new user entered
    broadcast socket, "user:entered", %{user: message, id: 7}
    
    #if PubSub.subscribers(PaperRacer.PubSub, socket.topic) == 2 do
      #broadcast socket, "event:begin", %{user: "Fred"}
    #end
    
    {:ok, socket}
  end
  
  def leave(reason, socket) do
    Logger.error inspect(reason)
    {:ok, socket}
  end
end
