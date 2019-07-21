defmodule Message.RouterTest do
  use ExUnit.Case, async: true
  use Plug.Test

  @opts Message.Router.init([])

  test "it returns pong" do
    # Create a test connection
    conn = conn(:get, "/")

    # Invoke the plug
    conn = Message.Router.call(conn, @opts)

    # Assert the response and status
    assert conn.state == :sent
    assert conn.status == 200
    assert conn.resp_body |> Poison.decode! == %{"status" => "ok"}
  end

  test "it returns 404 when no route matches" do
    # Create a test connection
    conn = conn(:get, "/fail")

    # Invoke the plug
    conn = Message.Router.call(conn, @opts)

    # Assert the response
    assert conn.status == 404
  end
end
