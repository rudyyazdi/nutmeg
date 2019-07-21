defmodule Message.RepoTest do
  use ExUnit.Case, async: true

  import Message.Repo

  test "all_messages" do
    assert {:ok, messages} = all_messages()
    assert messages |> length == 1
  end
end
