defmodule PaperRacer.View do
  use Phoenix.View, root: "web/templates"

  # The quoted expression returned by this block is applied
  # to this module and all other views that use this module.
  using do
    quote do
      # Import common functionality
      import PaperRacer.Router.Helpers

      # Use Phoenix.HTML to import all HTML functions (forms, tags, etc)
      use Phoenix.HTML
    end
  end

  # Functions defined here are available to all other views/templates
  def csrf_token(conn) do
    Plug.Conn.get_session(conn, :csrf_token)
  end
  
  def link_to(dest, message, %{class: class}) do
    safe "<a class=\"#{class}\" href=\"#{dest}\">#{message}</a>"
  end
  def link_to(dest, message) do
    safe "<a href=\"#{dest}\">#{message}</a>"
  end
  
  def javascript_tag(file) do
    safe "<script src=\"#{file}\" type=\"text/javascript\"></script>"
  end
end
