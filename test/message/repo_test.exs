defmodule Message.RepoTest do
  use ExUnit.Case, async: true

  import Message.Repo

  test "all_messages" do
    Mongo.delete_many(:mongo, "messages", %{})

    assert {:ok, messages} = all_messages()
    assert messages |> length == 0

    assert {:ok, message} =
             add_message(%Message.Model{text: "dede", username: "defe", channel: "dede"})

    assert {:ok, messages} = all_messages()
    assert messages |> length == 1
  end
end
