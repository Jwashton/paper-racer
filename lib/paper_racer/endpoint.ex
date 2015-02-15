defmodule PaperRacer.Endpoint do
  use Phoenix.Endpoint, otp_app: :paper_racer

  plug Plug.Static,
    at: "/", from: :paper_racer

  plug Plug.Logger

  # Code reloading will only work if the :code_reloader key of
  # the :phoenix application is set to true in your config file.
  plug Phoenix.CodeReloader

  plug Plug.Parsers,
    parsers: [:urlencoded, :multipart, :json],
    pass: ["*/*"],
    json_decoder: Poison

  plug Plug.MethodOverride
  plug Plug.Head

  plug Plug.Session,
    store: :cookie,
    key: "_paper_racer_key",
    signing_salt: "yFlvFb6I",
    encryption_salt: "UAQw7yXt"

  plug :router, PaperRacer.Router
end
