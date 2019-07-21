defmodule Message.Router do
  # import Plug.Conn

  # @spec init(any) :: any
  # def init(options), do: options

  # @spec call(Plug.Conn.t(), any) :: Plug.Conn.t()
  # def call(conn, _opts) do
  #   conn
  #   IO.inspect(conn)

  #   |> put_resp_content_type("text/plain")
  #   |> send_resp(200, "Hello World3!\n")
  # end

  use Plug.Router

  defp resolve(conn, status, res) when is_map(res) do
    conn |> send_resp(status, Poison.encode!(res))
  end

  defp resolve(conn, status, res) do
    conn |> send_resp(status, res)
  end

  defp resolve(conn, res) do
    conn |> resolve(200, res)
  end

  # This module is a Plug, that also implements it's own plug pipeline, below:

  # Using Plug.Logger for logging request information
  plug(Plug.Logger)
  # Import functions used for matching routes
  plug(:match)
  # Using Poison for JSON decoding
  # Note, order of plugs is important, by placing this _after_ the 'match' plug,
  # we will only parse the request AFTER there is a route match.
  plug(Plug.Parsers, parsers: [:json], json_decoder: Poison)

  # This module is a Plug, that also implements it's own plug pipeline, below:
  plug(Message.JsonMiddleware)

  # Import functions used for dispatching responses
  plug(:dispatch)

  # A simple route to test that the server is up
  # Note, all routes must return a connection as per the Plug spec.
  get "/" do
    conn |> resolve(%{"status" => "ok"})
  end

  match _ do
    conn |> resolve(404, "404")
  end
end
