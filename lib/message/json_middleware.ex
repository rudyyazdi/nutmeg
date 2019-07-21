defmodule Message.JsonMiddleware do
  import Plug.Conn

  @spec init(map) :: map
  def init(options) do
    options
  end

  @spec call(Plug.Conn.t, list(integer)) :: Plug.Conn.t
  def call(conn, _) do
    conn
    |> put_resp_header("accept", "application/json")
    |> put_resp_header("content-type", "application/json")
  end
end
